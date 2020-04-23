function S = Dynamic_analysis(x)  
     P1 = -1;
     P2 = 8;
     P3 = 4.75;
     P4 = 4.25;
     K = getGlobalx;
     delta_t = 1/60; %60 Hz
     x0 = x; 
    for t = 1:30

         Z(1) = P1 * delta_t^2 + 2 * x(1) - x0(1) - delta_t^2 * K(1) * sin(x(1) - x(2)) - delta_t^2 * K(2) * sin(x(1) - x(3)) - delta_t^2 * K(3) * sin(x(1) - x(4)) - delta_t^2 * K(4) * sin(x(1) - x(7));
         Z(2) = P1 * delta_t^2 + 2 * x(2) - x0(2) - delta_t^2 * K(5) * sin(x(2) - x(9)) - delta_t^2 * K(1) * sin(x(2) - x(1));
         Z(3) = P1 * delta_t^2 + 2 * x(3) - x0(3) - delta_t^2 * K(2) * sin(x(3) - x(1));
         Z(4) = P1 * delta_t^2 + 2 * x(4) - x0(4) - delta_t^2 * K(6) * sin(x(4) - x(5)) - delta_t^2 * K(3) * sin(x(4) - x(1));
         Z(5) = P1 * delta_t^2 + 2 * x(5) - x0(5) - delta_t^2 * K(7) * sin(x(5) - x(6)) - delta_t^2 * K(8) * sin(x(5) - x(7));

         Z(6) = P1 * delta_t^2 + 2 * x(6) - x0(6) - delta_t^2 * K(7) * sin(x(6) - x(5)) - delta_t^2 * K(9) * sin(x(6) - x(12));
         Z(7) = P1 * delta_t^2 + 2 * x(7) - x0(7) - delta_t^2 * K(8) * sin(x(7) - x(5)) - delta_t^2 * K(10) * sin(x(7) - x(10));
         Z(8) = P1 * delta_t^2 + 2 * x(8) - x0(8) - delta_t^2 * K(11) * sin(x(8) - x(10));
         Z(9) = P1 * delta_t^2 + 2 * x(9) - x0(9) - delta_t^2 * K(5) * sin(x(9) - x(2)) - delta_t^2 * K(12) * sin(x(9) - x(11));
         Z(10) = P1 * delta_t^2 + 2 * x(10) - x0(10) - delta_t^2 * K(10) * sin(x(10) - x(7)) - delta_t^2 * K(11) * sin(x(10) - x(8)) - delta_t^2 * K(13) * sin(x(10) - x(11));

         Z(11) = P1 * delta_t^2 + 2 * x(11) - x0(11) - delta_t^2 * K(12) * sin(x(11) - x(9)) - delta_t^2 * K(13) * sin(x(11) - x(10)) - delta_t^2 * K(14) * sin(x(11) - x(12)) - delta_t^2 * K(15) * sin(x(11) - x(13));
         Z(12) = P1 * delta_t^2 + 2 * x(12) - x0(12) - delta_t^2 * K(9) * sin(x(12) - x(6)) - delta_t^2 * K(14) * sin(x(12) - x(11)) - delta_t^2 * K(16) * sin(x(12) - x(13));
         Z(13) = P1 * delta_t^2 + 2 * x(13) - x0(13) - delta_t^2 * K(15) * sin(x(13) - x(11)) - delta_t^2 * K(14) * sin(x(13) - x(12)) - delta_t^2 * K(17) * sin(x(13) - x(14)) - delta_t^2 * K(18) * sin(x(13) - x(19));
         Z(14) = P1 * delta_t^2 + 2 * x(14) - x0(14) - delta_t^2 * K(17) * sin(x(14) - x(13)) - delta_t^2 * K(19) * sin(x(14) - x(15)) - delta_t^2 * K(20) * sin(x(14) - x(17));
         Z(15) = P1 * delta_t^2 + 2 * x(15) - x0(15) - delta_t^2 * K(19) * sin(x(15) - x(14)) - delta_t^2 * K(21) * sin(x(15) - x(16));

         Z(16) = P1 * delta_t^2 + 2 * x(16) - x0(16) - delta_t^2 * K(21) * sin(x(16) - x(15)) - delta_t^2 * K(22) * sin(x(16) - x(17));
         Z(17) = P1 * delta_t^2 + 2 * x(17) - x0(17) - delta_t^2 * K(20) * sin(x(17) - x(14)) - delta_t^2 * K(22) * sin(x(17) - x(16)) - delta_t^2 * K(23) * sin(x(17) - x(18));
         Z(18) = P3 * delta_t^2 + 2 * x(18) - x0(18) - delta_t^2 * K(23) * sin(x(18) - x(17)) - delta_t^2 * K(24) * sin(x(18) - x(43));
         Z(19) = P4 * delta_t^2 + 2 * x(19) - x0(19) - delta_t^2 * K(18) * sin(x(19) - x(13)) - delta_t^2 * K(25) * sin(x(19) - x(21)) - delta_t^2 * K(26) * sin(x(19) - x(38));
         Z(20) = P1 * delta_t^2 + 2 * x(20) - x0(20) - delta_t^2 * K(27) * sin(x(20) - x(38));

         Z(21) = P1 * delta_t^2 + 2 * x(21) - x0(21) - delta_t^2 * K(25) * sin(x(21) - x(19)) - delta_t^2 * K(28) * sin(x(21) - x(22)) - delta_t^2 * K(29) * sin(x(21) - x(29));
         Z(22) = P1 * delta_t^2 + 2 * x(22) - x0(22) - delta_t^2 * K(28) * sin(x(22) - x(21)) - delta_t^2 * K(30) * sin(x(22) - x(23)) - delta_t^2 * K(31) * sin(x(22) - x(25));
         Z(23) = P1 * delta_t^2 + 2 * x(23) - x0(23) - delta_t^2 * K(30) * sin(x(23) - x(22)) - delta_t^2 * K(32) * sin(x(23) - x(24));
         Z(24) = P1 * delta_t^2 + 2 * x(24) - x0(24) - delta_t^2 * K(32) * sin(x(24) - x(23)) - delta_t^2 * K(33) * sin(x(24) - x(26));
         Z(25) = P1 * delta_t^2 + 2 * x(25) - x0(25) - delta_t^2 * K(31) * sin(x(25) - x(22));

         Z(26) = P1 * delta_t^2 + 2 * x(26) - x0(26) - delta_t^2 * K(33) * sin(x(26) - x(24)) - delta_t^2 * K(34) * sin(x(26) - x(27)) - delta_t^2 * K(35) * sin(x(26) - x(28)) - delta_t^2 * K(36) * sin(x(26) - x(30));
         Z(27) = P3 * delta_t^2 + 2 * x(27) - x0(27) - delta_t^2 * K(34) * sin(x(27) - x(26));
         Z(28) = P3 * delta_t^2 + 2 * x(28) - x0(28) - delta_t^2 * K(35) * sin(x(28) - x(26));
         Z(29) = P3 * delta_t^2 + 2 * x(29) - x0(29) - delta_t^2 * K(29) * sin(x(29) - x(21));
         Z(30) = P1 * delta_t^2 + 2 * x(30) - x0(30) - delta_t^2 * K(36) * sin(x(30) - x(26)) - delta_t^2 * K(37) * sin(x(30) - x(31)) - delta_t^2 * K(38) * sin(x(30) - x(32)) - delta_t^2 * K(39) * sin(x(30) - x(33)) - delta_t^2 * K(40) * sin(x(30) - x(85));

         Z(31) = P1 * delta_t^2 + 2 * x(31) - x0(31) - delta_t^2 * K(37) * sin(x(31) - x(30));
         Z(32) = P1 * delta_t^2 + 2 * x(32) - x0(32) - delta_t^2 * K(38) * sin(x(32) - x(30));
         Z(33) = P1 * delta_t^2 + 2 * x(33) - x0(33) - delta_t^2 * K(39) * sin(x(33) - x(30)) - delta_t^2 * K(41) * sin(x(33) - x(83));
         Z(34) = P1 * delta_t^2 + 2 * x(34) - x0(34) - delta_t^2 * K(42) * sin(x(34) - x(35)) - delta_t^2 * K(43) * sin(x(34) - x(49)) - delta_t^2 * K(44) * sin(x(34) - x(67)) - delta_t^2 * K(45) * sin(x(34) - x(68));
         Z(35) = P1 * delta_t^2 + 2 * x(35) - x0(35) - delta_t^2 * K(42) * sin(x(35) - x(34)) - delta_t^2 * K(46) * sin(x(35) - x(36));

         Z(36) = P1 * delta_t^2 + 2 * x(36) - x0(36) - delta_t^2 * K(46) * sin(x(36) - x(35)) - delta_t^2 * K(47) * sin(x(36) - x(37));
         Z(37) = P1 * delta_t^2 + 2 * x(37) - x0(37) - delta_t^2 * K(47) * sin(x(37) - x(36)) - delta_t^2 * K(48) * sin(x(37) - x(38)) - delta_t^2 * K(49) * sin(x(37) - x(39));
         Z(38) = P3 * delta_t^2 + 2 * x(38) - x0(38) - delta_t^2 * K(26) * sin(x(38) - x(19)) - delta_t^2 * K(27) * sin(x(38) - x(20)) - delta_t^2 * K(48) * sin(x(38) - x(37)) - delta_t^2 * K(50) * sin(x(38) - x(39));
         Z(39) = P1 * delta_t^2 + 2 * x(39) - x0(39) - delta_t^2 * K(49) * sin(x(39) - x(37)) - delta_t^2 * K(50) * sin(x(39) - x(38)) - delta_t^2 * K(51) * sin(x(39) - x(44));
         Z(40) = P1 * delta_t^2 + 2 * x(40) - x0(40) - delta_t^2 * K(52) * sin(x(40) - x(41));

         Z(41) = P1 * delta_t^2 + 2 * x(41) - x0(41) - delta_t^2 * K(52) * sin(x(41) - x(40)) - delta_t^2 * K(53) * sin(x(41) - x(42)) - delta_t^2 * K(54) * sin(x(41) - x(44));
         Z(42) = P1 * delta_t^2 + 2 * x(42) - x0(42) - delta_t^2 * K(53) * sin(x(42) - x(41));
         Z(43) = P3 * delta_t^2 + 2 * x(43) - x0(43) - delta_t^2 * K(24) * sin(x(43) - x(18)) - delta_t^2 * K(55) * sin(x(43) - x(62)) - delta_t^2 * K(57) * sin(x(43) - x(66)) - delta_t^2 * K(56) * sin(x(43) - x(64));
         Z(44) = P1 * delta_t^2 + 2 * x(44) - x0(44) - delta_t^2 * K(51) * sin(x(44) - x(39)) - delta_t^2 * K(54) * sin(x(44) - x(41)) - delta_t^2 * K(58) * sin(x(44) - x(45)) - delta_t^2 * K(59) * sin(x(44) - x(60));
         Z(45) = P1 * delta_t^2 + 2 * x(45) - x0(45) - delta_t^2 * K(58) * sin(x(45) - x(44)) - delta_t^2 * K(60) * sin(x(45) - x(46));

         Z(46) = P1 * delta_t^2 + 2 * x(46) - x0(46) - delta_t^2 * K(60) * sin(x(46) - x(45)) - delta_t^2 * K(61) * sin(x(46) - x(48)) - delta_t^2 * K(62) * sin(x(46) - x(52)) - delta_t^2 * K(63) * sin(x(46) - x(59));
         Z(47) = P1 * delta_t^2 + 2 * x(47) - x0(47) - delta_t^2 * K(64) * sin(x(47) - x(48));
         Z(48) = P1 * delta_t^2 + 2 * x(48) - x0(48) - delta_t^2 * K(61) * sin(x(48) - x(46)) - delta_t^2 * K(65) * sin(x(48) - x(49));
         Z(49) = P1 * delta_t^2 + 2 * x(49) - x0(49) - delta_t^2 * K(65) * sin(x(49) - x(48));
         Z(50) = P1 * delta_t^2 + 2 * x(50) - x0(50) - delta_t^2 * K(43) * sin(x(50) - x(34)) - delta_t^2 * K(66) * sin(x(50) - x(51));

         Z(51) = P1 * delta_t^2 + 2 * x(51) - x0(51) - delta_t^2 * K(66) * sin(x(51) - x(50));
         Z(52) = P1 * delta_t^2 + 2 * x(52) - x0(52) - delta_t^2 * K(62) * sin(x(52) - x(46)) - delta_t^2 * K(67) * sin(x(52) - x(53)) - delta_t^2 * K(68) * sin(x(52) - x(58));
         Z(53) = P1 * delta_t^2 + 2 * x(53) - x0(53) - delta_t^2 * K(67) * sin(x(53) - x(52)) - delta_t^2 * K(69) * sin(x(53) - x(54));
         Z(54) = P1 * delta_t^2 + 2 * x(54) - x0(54) - delta_t^2 * K(69) * sin(x(54) - x(53)) - delta_t^2 * K(70) * sin(x(54) - x(55)) - delta_t^2 * K(71) * sin(x(54) - x(70)) - delta_t^2 * K(72) * sin(x(54) - x(97));
         Z(55) = P1 * delta_t^2 + 2 * x(55) - x0(55) - delta_t^2 * K(70) * sin(x(55) - x(54)) - delta_t^2 * K(73) * sin(x(55) - x(56));

         Z(56) = P1 * delta_t^2 + 2 * x(56) - x0(56) - delta_t^2 * K(73) * sin(x(56) - x(55)) - delta_t^2 * K(74) * sin(x(56) - x(57)) - delta_t^2 * K(75) * sin(x(56) - x(62)); 
         Z(57) = P1 * delta_t^2 + 2 * x(57) - x0(57) - delta_t^2 * K(74) * sin(x(57) - x(56));
         Z(58) = P1 * delta_t^2 + 2 * x(58) - x0(58) - delta_t^2 * K(68) * sin(x(58) - x(52)) - delta_t^2 * K(76) * sin(x(58) - x(59));
         Z(59) = P1 * delta_t^2 + 2 * x(59) - x0(59) - delta_t^2 * K(76) * sin(x(59) - x(58)) - delta_t^2 * K(77) * sin(x(59) - x(60));
         Z(60) = P1 * delta_t^2 + 2 * x(60) - x0(60) - delta_t^2 * K(59) * sin(x(60) - x(44)) - delta_t^2 * K(77) * sin(x(60) - x(59)) - delta_t^2 * K(78) * sin(x(60) - x(61)) - delta_t^2 * K(79) * sin(x(60) - x(104));

         Z(61) = P1 * delta_t^2 + 2 * x(61) - x0(61) - delta_t^2 * K(78) * sin(x(61) - x(60));
         Z(62) = P1 * delta_t^2 + 2 * x(62) - x0(62) - delta_t^2 * K(75) * sin(x(62) - x(56)) - delta_t^2 * K(55) * sin(x(62) - x(43)) - delta_t^2 * K(80) * sin(x(62) - x(63));
         Z(63) = P1 * delta_t^2 + 2 * x(63) - x0(63) - delta_t^2 * K(80) * sin(x(63) - x(62)) - delta_t^2 * K(81) * sin(x(63) - x(64)) - delta_t^2 * K(82) * sin(x(63) - x(105)); 
         Z(64) = P3 * delta_t^2 + 2 * x(64) - x0(64) - delta_t^2 * K(56) * sin(x(64) - x(43)) - delta_t^2 * K(81) * sin(x(64) - x(63));
         Z(65) = P1 * delta_t^2 + 2 * x(65) - x0(65) - delta_t^2 * K(83) * sin(x(65) - x(69)) - delta_t^2 * K(84) * sin(x(65) - x(72)) - delta_t^2 * K(85) * sin(x(65) - x(80)); 

         Z(66) = P1 * delta_t^2 + 2 * x(66) - x0(66) - delta_t^2 * K(57) * sin(x(66) - x(43));
         Z(67) = P3 * delta_t^2 + 2 * x(67) - x0(67) - delta_t^2 * K(44) * sin(x(67) - x(34)) - delta_t^2 * K(86) * sin(x(67) - x(68));
         Z(68) = P1 * delta_t^2 + 2 * x(68) - x0(68) - delta_t^2 * K(45) * sin(x(68) - x(34)) - delta_t^2 * K(86) * sin(x(68) - x(67)) - delta_t^2 * K(87) * sin(x(68) - x(69)) - delta_t^2 * K(88) * sin(x(68) - x(70));
         Z(69) = P1 * delta_t^2 + 2 * x(69) - x0(69) - delta_t^2 * K(83) * sin(x(69) - x(65)) - delta_t^2 * K(87) * sin(x(69) - x(68)) - delta_t^2 * K(89) * sin(x(69) - x(82));
         Z(70) = P1 * delta_t^2 + 2 * x(70) - x0(70) - delta_t^2 * K(71) * sin(x(70) - x(54)) - delta_t^2 * K(88) * sin(x(70) - x(68)) - delta_t^2 * K(90) * sin(x(70) - x(71));

         Z(71) = P1 * delta_t^2 + 2 * x(71) - x0(71) - delta_t^2 * K(90) * sin(x(71) - x(70));
         Z(72) = P1 * delta_t^2 + 2 * x(72) - x0(72) - delta_t^2 * K(84) * sin(x(72) - x(65)) - delta_t^2 * K(91) * sin(x(72) - x(73)) - delta_t^2 * K(92) * sin(x(72) - x(74));
         Z(73) = P1 * delta_t^2 + 2 * x(73) - x0(73) - delta_t^2 * K(91) * sin(x(73) - x(72));
         Z(74) = P1 * delta_t^2 + 2 * x(74) - x0(74) - delta_t^2 * K(92) * sin(x(74) - x(72)) - delta_t^2 * K(93) * sin(x(74) - x(75)) - delta_t^2 * K(94) * sin(x(74) - x(81)) - delta_t^2 * K(95) * sin(x(74) - x(97));
         Z(75) = P1 * delta_t^2 + 2 * x(75) - x0(75) - delta_t^2 * K(93) * sin(x(75) - x(74)) - delta_t^2 * K(96) * sin(x(75) - x(76)) - delta_t^2 * K(97) * sin(x(75) - x(78));

         Z(76) = P1 * delta_t^2 + 2 * x(76) - x0(76) - delta_t^2 * K(96) * sin(x(76) - x(75)) - delta_t^2 * K(98) * sin(x(76) - x(77));
         Z(77) = P1 * delta_t^2 + 2 * x(77) - x0(77) - delta_t^2 * K(98) * sin(x(77) - x(76)) - delta_t^2 * K(99) * sin(x(77) - x(79)) - delta_t^2 * K(100) * sin(x(77) - x(94));
         Z(78) = P1 * delta_t^2 + 2 * x(78) - x0(78) - delta_t^2 * K(97) * sin(x(78) - x(75));
         Z(79) = P3 * delta_t^2 + 2 * x(79) - x0(79) - delta_t^2 * K(99) * sin(x(79) - x(77)) - delta_t^2 * K(101) * sin(x(79) - x(80));
         Z(80) = P1 * delta_t^2 + 2 * x(80) - x0(80) - delta_t^2 * K(85) * sin(x(80) - x(65)) - delta_t^2 * K(101) * sin(x(80) - x(79)) - delta_t^2 * K(102) * sin(x(80) - x(82)) - delta_t^2 * K(103) * sin(x(80) - x(87));

         Z(81) = P3 * delta_t^2 + 2 * x(81) - x0(81) - delta_t^2 * K(94) * sin(x(81) - x(74)) - delta_t^2 * K(104) * sin(x(81) - x(82));
         Z(82) = P3 * delta_t^2 + 2 * x(82) - x0(82) - delta_t^2 * K(89) * sin(x(82) - x(69)) - delta_t^2 * K(102) * sin(x(82) - x(80)) - delta_t^2 * K(104) * sin(x(82) - x(81)) - delta_t^2 * K(105) * sin(x(82) - x(83)) - delta_t^2 * K(106) * sin(x(82) - x(84));
         Z(83) = P1 * delta_t^2 + 2 * x(83) - x0(83) - delta_t^2 * K(41) * sin(x(83) - x(33)) - delta_t^2 * K(105) *sin(x(83) - x(82));
         Z(84) = P1 * delta_t^2 + 2 * x(84) - x0(84) - delta_t^2 * K(106) * sin(x(84) - x(82)) - delta_t^2 * K(107) * sin(x(84) - x(94));
         Z(85) = P1 * delta_t^2 + 2 * x(85) - x0(85) - delta_t^2 * K(40) * sin(x(85) - x(30)) - delta_t^2 * K(108) * sin(x(85) - x(86)) - delta_t^2 * K(109) * sin(x(85) - x(89));

         Z(86) = P3 * delta_t^2 + 2 * x(86) - x0(86) - delta_t^2 * K(108) * sin(x(86) - x(85)) - delta_t^2 * K(110) * sin(x(86) - x(87)) - delta_t^2 * K(111) * sin(x(86) - x(88)) - delta_t^2 * K(112) * sin(x(86) - x(94));
         Z(87) = P1 * delta_t^2 + 2 * x(87) - x0(87) - delta_t^2 * K(103) * sin(x(87) - x(80)) - delta_t^2 * K(110) * sin(x(87) - x(86));
         Z(88) = P1 * delta_t^2 + 2 * x(88) - x0(88) - delta_t^2 * K(111) * sin(x(88) - x(86)) - delta_t^2 * K(113) * sin(x(88) - x(89)) - delta_t^2 * K(114) * sin(x(88) - x(91));
         Z(89) = P1 * delta_t^2 + 2 * x(89) - x0(89) - delta_t^2 * K(109) * sin(x(89) - x(85)) - delta_t^2 * K(113) * sin(x(89) - x(88)) - delta_t^2 * K(115) * sin(x(89) - x(90));
         Z(90) = P1 * delta_t^2 + 2 * x(90) - x0(90) - delta_t^2 * K(115) * sin(x(90) - x(89));

         Z(91) = P1 * delta_t^2 + 2 * x(91) - x0(91) - delta_t^2 * K(114) * sin(x(91) - x(88)) - delta_t^2 * K(116) * sin(x(91) - x(92));
         Z(92) = P2 * delta_t^2 + 2 * x(92) - x0(92) - delta_t^2 * K(116) * sin(x(92) - x(91)) - delta_t^2 * K(117) * sin(x(92) - x(93));
         Z(93) = P3 * delta_t^2 + 2 * x(93) - x0(93) - delta_t^2 * K(117) * sin(x(93) - x(92));
         Z(94) = P4 * delta_t^2 + 2 * x(94) - x0(94) - delta_t^2 * K(107) * sin(x(94) - x(84)) - delta_t^2 * K(112) * sin(x(94) - x(86)) - delta_t^2 * K(100) * sin(x(94) - x(77)) - delta_t^2 * K(118) * sin(x(94) - x(95)) - delta_t^2 * K(119) * sin(x(94) - x(96));
         Z(95) = P1 * delta_t^2 + 2 * x(95) - x0(95) - delta_t^2 * K(118) * sin(x(95) - x(94));

         Z(96) = P1 * delta_t^2 + 2 * x(96) - x0(96) - delta_t^2 * K(119) * sin(x(96) - x(94));
         Z(97) = P1 * delta_t^2 + 2 * x(97) - x0(97) - delta_t^2 * K(72) * sin(x(97) - x(54)) - delta_t^2 * K(95) * sin(x(97) - x(74)) - delta_t^2 * K(120) * sin(x(97) - x(98));
         Z(98) = P1 * delta_t^2 + 2 * x(98) - x0(98) - delta_t^2 * K(120) * sin(x(98) - x(97)) - delta_t^2 * K(121) * sin(x(98) - x(99));
         Z(99) = P1 * delta_t^2 + 2 * x(99) - x0(99) - delta_t^2 * K(121) * sin(x(99) - x(98)) - delta_t^2 * K(122) * sin(x(99) - x(100)) - delta_t^2 * K(123) * sin(x(99) - x(102));
         Z(100) = P1 * delta_t^2 + 2 * x(100) - x0(100) - delta_t^2 * K(122) * sin(x(100) - x(99)) - delta_t^2 * K(124) * sin(x(100) - x(101));

         Z(101) = P1 * delta_t^2 + 2 * x(101) - x0(101) - delta_t^2 * K(124) * sin(x(101) - x(100));
         Z(102) = P1 * delta_t^2 + 2 * x(102) - x0(102) - delta_t^2 * K(123) * sin(x(102) - x(99));
         Z(103) = P1 * delta_t^2 + 2 * x(103) - x0(103) - delta_t^2 * K(125) * sin(x(103) - x(104));
         Z(104) = P1 * delta_t^2 + 2 * x(104) - x0(104) - delta_t^2 * K(79) * sin(x(104) - x(60)) - delta_t^2 * K(126) * sin(x(104) - x(106));
         Z(105) = P1 * delta_t^2 + 2 * x(105) - x0(105) - delta_t^2 * K(82) * sin(x(105) - x(63)) - delta_t^2 * K(127) * sin(x(105) - x(106)) - delta_t^2 * K(128) * sin(x(105) - x(107));

         Z(106) = P1 * delta_t^2 + 2 * x(106) - x0(106) - delta_t^2 * K(126) * sin(x(106) - x(104)) - delta_t^2 * K(127) * sin(x(106) - x(105)) - delta_t^2 * K(129) * sin(x(106) - x(108));
         Z(107) = P2 * delta_t^2 + 2 * x(107) - x0(107) - delta_t^2 * K(128) * sin(x(107) - x(105)) - delta_t^2 * K(130) * sin(x(107) - x(108));
         Z(108) = P1 * delta_t^2 + 2 * x(108) - x0(108) - delta_t^2 * K(129) * sin(x(108) - x(106)) - delta_t^2 * K(130) * sin(x(108) - x(107)) - delta_t^2 * K(131) * sin(x(108) - x(109));
         Z(109) = P3 * delta_t^2 + 2 * x(109) - x0(109) - delta_t^2 * K(131) * sin(x(109) - x(108));

         x0 = x;
         x = Z;

    end

    num = 0;
    w = null(109);
    for j = 1:109
        if j~=18 && j~=19 && j~=27 && j~=28 && j~=29 && j~=38 && j~=43 && j~=64 && j~=67 && j~=79 && j~=81 && j~=82 &&...
           j~=86 && j~=92 && j~=93 && j~=94 && j~=107 && j~=109
                w(j) = (x(j) - x0(j)) / delta_t;
                if w(j) > 2 * 3.14 * 0.02
                    num = num + 1;
                end  
        end
    end
    S = num;
    fprintf('%d nodes\n', num);
 end
     
        
