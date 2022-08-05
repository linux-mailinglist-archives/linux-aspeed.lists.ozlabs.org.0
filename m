Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5955658C7CF
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Aug 2022 13:48:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1ZFt6lxGz3056
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Aug 2022 21:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ju8lg4x6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=j220584470k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ju8lg4x6;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzfyV2G6qz2xJ8
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Aug 2022 19:13:05 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id u133so1718253pfc.10
        for <linux-aspeed@lists.ozlabs.org>; Fri, 05 Aug 2022 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/PmbKSoXlx8NE7NhxNR03vLeN9/hI3MbHe4vmiJGS3I=;
        b=ju8lg4x69mTNAkCCDTfZWjhjst9l8SDoGxK6JuJD0Ih3O3yJRMXmzAKcSPpRQoFpn1
         xCjhyrVJ6h0CVlm1bHIetKQklYN7qY4sBPft6l7tDTD8sPii7pJkNtcr+d9LT5oJOhC7
         sA+VbxhSgcNna+FSLSEqiqonPrOKBurxfMY8XefewziseeiHQyWn/oOqAnrQAdUsM5NS
         rPHPlNNANeObt/bhpL33i7ju/CHCgxvXrclPqXvwTSdmVwtYuff2ZXpr7qJg7w51BkN2
         H9dLJfluS8xAbylTTJTKd4BObtKEeNNq+8cacsFxbkz+Bn9nmjCK1cdo9kb98G0iGE4m
         XL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/PmbKSoXlx8NE7NhxNR03vLeN9/hI3MbHe4vmiJGS3I=;
        b=KTVXw8jtMbYdVl5ZGvYVL6SYtCt6DQxJd2hp/BgELZh9QMoZFODnuT2o23BWgNsSRn
         Og0yrOYt8CTT8sQJDSCtPwkv5egXewog9E9CDAVaRZxbzS8mLOyDFfQ7qjWoaiDLiVuj
         R3G07yw8T7uyBc0O7Xq8WnWOUWabFjzh1kjTeJ219Qi+ks0EhzL/vzaZPqIIWbYsUXUj
         ckvAack4r0V31J4Vzdh5AKxpoaGaSWX/qPwjrojs+ECtOZZ6LEBbYuvdelQstsLD/BoW
         xEoT+k9maKsC0A0nrPPMJgHhEeQgC4aMK8D2+JjvDpZfYyVz9QYfFL84Hs7+lfAF3Ri2
         IMoA==
X-Gm-Message-State: ACgBeo1ofq0N3q3CotSFxFPh7EwbxFiZ8qQTdrvC7XlrqrImT/L8nY3N
	1TuAX+AFMIl6N2KaaEP1eZE=
X-Google-Smtp-Source: AA6agR5lgFgOB+298Wl0efTElU46gL/YUYfFXwuI3pGMyz1POF1VWbYaYQ7E4QZ9LvQwWaPCoMwI3Q==
X-Received: by 2002:a63:5f09:0:b0:41c:da4f:e498 with SMTP id t9-20020a635f09000000b0041cda4fe498mr5144661pgb.276.1659690780835;
        Fri, 05 Aug 2022 02:13:00 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id p2-20020a170903248200b001635b86a790sm2491334plw.44.2022.08.05.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 02:13:00 -0700 (PDT)
From: Ken Chen <j220584470k@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/1] ARM: dts: aspeed-g6: enable more UART controllers
Date: Fri,  5 Aug 2022 17:09:57 +0800
Message-Id: <20220805090957.470434-1-j220584470k@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Aug 2022 21:47:58 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin.Lai@quantatw.com, Michael Garner <garnermic@fb.com>, linux-kernel@vger.kernel.org, Cosmo.Chou@quantatw.com, Ken Chen <j220584470k@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Setup the configuration of UART6, UART7, UART8, and UART9 in
aspeed-g6.dtsi.

Signed-off-by: Ken Chen <j220584470k@gmail.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 64 +++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 8c0de3f27883b..fe7cef6b5e976 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -34,8 +34,12 @@ aliases {
 		serial2 = &uart3;
 		serial3 = &uart4;
 		serial4 = &uart5;
-		serial5 = &vuart1;
-		serial6 = &vuart2;
+		serial5 = &uart6;
+		serial6 = &uart7;
+		serial7 = &uart8;
+		serial8 = &uart9;
+		serial9 = &vuart1;
+		serial10 = &vuart2;
 	};
 
 
@@ -745,6 +749,62 @@ uart4: serial@1e78f000 {
 				status = "disabled";
 			};
 
+			uart6: serial@1e790000 {
+				compatible = "ns16550a";
+				reg = <0x1e790000 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART6CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart6_default>;
+
+				status = "disabled";
+			};
+
+			uart7: serial@1e790100 {
+				compatible = "ns16550a";
+				reg = <0x1e790100 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART7CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart7_default>;
+
+				status = "disabled";
+			};
+
+			uart8: serial@1e790200 {
+				compatible = "ns16550a";
+				reg = <0x1e790200 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART8CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart8_default>;
+
+				status = "disabled";
+			};
+
+			uart9: serial@1e790300 {
+				compatible = "ns16550a";
+				reg = <0x1e790300 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART9CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart9_default>;
+
+				status = "disabled";
+			};
+
 			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
-- 
2.31.1

