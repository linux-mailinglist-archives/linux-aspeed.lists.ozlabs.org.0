Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC997452C
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 23:59:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Hg02Zqpz2yks
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2024 07:59:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726005578;
	cv=none; b=SD2EhuMCop62L+41bp531siLTPFUuqhwhJaiuvTLQ/4kPdQdXt8Fp9kaWlDltepRDmZEUWmudS8/enuRMfXT8dmgbQWe3PaSP2rrW/3bTFPuEG8hcaWwTadTRFZrBj0JCg+PCVfeDHXIfBkrze/VRkN561Jbz94j3ktmPbpnfJ0VgVXHWJ3qVCdFbFYOx+/9cfL5DgiLnyAd+okrbPomWBgCAnPgddXYw8hGFXm9HYK9w8b/ezF5FuCBb6i4jDR9EguE9rrXyjy4ni5LgtL6jPCSFoBprKmCTNzG2QPnsN56+PAiRsboGCqH5tT7t/ajojWfwjOpPToM2sUkB4u9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726005578; c=relaxed/relaxed;
	bh=QeMDfj2hAO9qWOrtnZ4J3X+rOKP0c9EMFQRLGckoRWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lxsg0Ev8tBtG9LR8DfOmvLaN0+Xwxt58QT00JHWjLEW0SzNY2c/HKKmgV1rIwp1HJBVHVp0xX/xHBbASgBDbYJYFzqBdn4nuBXsFs06EO4L19Nf6Qc6J9NAUwn63racvkSHCKI9sB6QUINU0pFuT70Gq6F5eLvkF0unhYbgJFJ9r8uEedMEOITbHQ25vq8CK/4wEZzg9m4udqsVk0yMYr65eM/s40FsKa+nwOFXmNhnS8JQioS4sKQx4/3Gcdr53EfLIFi/flc2D3qec4B4yoNDRtQEHWuhI3xnhyTRg1kDqMp0v5gGd1RmckpVt1vqZif8rXnTWrvXgXu/j3RN07A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sF2eL0nE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sF2eL0nE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Hfx62ZTz2yVB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2024 07:59:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0CD8A43C2A;
	Tue, 10 Sep 2024 21:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD480C4CEC3;
	Tue, 10 Sep 2024 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005575;
	bh=sHbmyeDsKsQ0beMtDxdRFghyuxHXTudSEs0ygX4hnS4=;
	h=From:To:Cc:Subject:Date:From;
	b=sF2eL0nEPcvKbRNKhif6TOqup2fkjV1cIJPPEzEUANmqRGEenf/yIdtl/VgxMpZOJ
	 0dXMp3ee1ys0rLLGOxPOEckR21n8ccgly7d1Hbg6BapIDJaRC22HiPoccqbfzjEcpa
	 TM5HVatEYBrdiZiCnHYhh9efV6IA6RDCQM6GmEXmiUz2jG4AY76xc0qpAaeMXSg7WO
	 IbZInWXlRzgCP2uX40ajPNV6oQlelA2ZZnOmMFFM0bWu06Axv9pbl6C9xPlrfqO1Fa
	 uaU7a0PIBeD8udfJQbQ+hwDLgkm9vJMOo0S3RQou6/w7h8sz/1IQhFyxPIdgTpjbXu
	 QZxkB4EG5bc5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH] ARM: dts: aspeed: Fix at24 EEPROM node names
Date: Tue, 10 Sep 2024 16:59:29 -0500
Message-ID: <20240910215929.823913-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts  | 8 ++++----
 arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts | 6 +++---
 arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi     | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
index 983853eedaef..fd361cf073c2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
@@ -381,7 +381,7 @@ SMB_IPMB_3V3AUX_SCL: i2c@5 {
 			#size-cells = <0>;
 			reg = <5>;
 
-			U190_fru@51 {
+			eeprom@51 {
 				compatible = "atmel,24c128";
 				reg = <0x51>;
 				pagesize = <32>;
@@ -460,7 +460,7 @@ &i2c3 {
 	status = "okay";
 
 	/* MB FRU (U173) @ 0xA2 */
-	mb_fru: mb_fru@51 {
+	mb_fru: eeprom@51 {
 		compatible = "atmel,24c128";
 		reg = <0x51>;
 		pagesize = <32>;
@@ -472,7 +472,7 @@ FP_U1_tmp75@4a {
 		reg = <0x4a>;
 	};
 
-	FP_U4_fru@52 {
+	eeprom@52 {
 		compatible = "atmel,24c02";
 		reg = <0x52>;
 		pagesize = <16>;
@@ -593,7 +593,7 @@ &i2c14 {
 	status = "okay";
 
 	/* SCM FRU (U19) @ 0xA2 */
-	scm_fru: scm_fru@51 {
+	scm_fru: eeprom@51 {
 		compatible = "atmel,24c128";
 		reg = <0x51>;
 		pagesize = <32>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts
index b8f0b08018a3..98f3e0437704 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts
@@ -154,7 +154,7 @@ i2c@7 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <7>;
-					at24@50 {
+					eeprom@50 {
 						compatible = "atmel,24c64";
 						reg = <0x50>;
 						pagesize = <32>;
@@ -196,7 +196,7 @@ i2c@7 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <7>;
-					at24@50 {
+					eeprom@50 {
 						compatible = "atmel,24c64";
 						reg = <0x50>;
 						pagesize = <32>;
@@ -205,7 +205,7 @@ at24@50 {
 					};
 				};
 			};
-			at24@50 {
+			eeprom@50 {
 				compatible = "atmel,24c64";
 				reg = <0x50>;
 				pagesize = <32>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi
index 1a5b25b2ea29..16815eede710 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi
@@ -291,7 +291,7 @@ &i2c11 {
 	/* SMB_BMC_MGMT_LVC3 */
 	status = "okay";
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-- 
2.45.2

