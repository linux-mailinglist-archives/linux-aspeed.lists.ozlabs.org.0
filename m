Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15139D34E
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 05:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyz3L3N5yz3079
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 13:13:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=b13FwupJ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b13FwupJ; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyz3C0Dyrz2yXX
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 13:13:26 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id y15so12029941pfl.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Jun 2021 20:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tja2eEKRLdtZx1+yDf5N9kFI3VpM2P40hbwrYRqxeDs=;
 b=b13FwupJemHzLwD8SPxER+JyLyjyeUH0Na+gXlXsT3Am6A9NH6NPAJ6nMvPhoG+Nij
 lufeUeH8EW+J8Cu84ZFFuFwsxNT2QgOljEQXrntX+ANvbmWQoVE2BOl4RtXcl+kL7fUZ
 2IR9oiA7Ir1Rnfk3YcivCzROpaGucauNdLxBQKZvkhEX5XwLthSfBXtupAZ5Z5aZqzTk
 2c0fAkRPlkStAKGs37rRNEsDvMUQvEVB2RmH7rMf1JYg6IzLaeriMA2I7Zt3m2qKHvWD
 LWwCkqsdI3vkXLSIyPGVPNMtyulHBSBujjQUwn7QC2jEcU7MN6ZydXd89o00CvOa3UVu
 5g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tja2eEKRLdtZx1+yDf5N9kFI3VpM2P40hbwrYRqxeDs=;
 b=gnM4k/HO92KiaA2YbWNDq68nNalmhrcmd+ffe4foeJqL09M/aj2bIEilKuGK9IDM/w
 D5TbH6Sex5ZGrTn+S+kGPEIfV6DfFzI4pbfkC5ZVy7VY7wr2rlghjhI28dqAQqAm5GD2
 k2XDGKLmLKkoasS/Gp+yqVf0Oq+EqnjgnlNx6WqXBj/mT0zK4ag5Cz+4T6TaJSVp3JIm
 jMC3EBKnoVhznJJkal+AeV3L2uM1vICRPYC6fr1l9Tmyj13emufe55Qhe1UNeV9kAkrS
 7L7CiU9GO6YSWI3JCqug/OVlIeqlp5IO8dCzp+2EWABFzXIbr5nEKTc6v/UcwCywhCB1
 ETGQ==
X-Gm-Message-State: AOAM5339xQchKg+a5DWtIgise/N6/AKP9OnN0E94kKGETbYYcTftFBy+
 XlQSKGyMwGRiMd4I1nwDSHY=
X-Google-Smtp-Source: ABdhPJwoSjxJE0jdTVPwIAGkiR3+9aZa/+hKhDDsbd6B+3V84okEaeYiIxajeWL++e9FCvHscWyRKg==
X-Received: by 2002:aa7:96d0:0:b029:2e9:fea1:c9c1 with SMTP id
 h16-20020aa796d00000b02902e9fea1c9c1mr14997535pfq.67.1623035603821; 
 Sun, 06 Jun 2021 20:13:23 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x33sm5763751pfh.108.2021.06.06.20.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 20:13:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH 1/6] ARM: dts: aspeed: everest: Add system level indicator leds
Date: Mon,  7 Jun 2021 12:42:54 +0930
Message-Id: <20210607031259.475020-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607031259.475020-1-joel@jms.id.au>
References: <20210607031259.475020-1-joel@jms.id.au>
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
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

These are the system level indicator leds that are driven by
PCA9551 connected to the Operator Panel.

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 2ddd10e93a80..6a17b75b5d5b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -890,6 +890,48 @@ eeprom@50 {
 				compatible = "atmel,24c32";
 				reg = <0x50>;
 			};
+
+			pca_oppanel: pca9551@60 {
+				compatible = "nxp,pca9551";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "front-sys-id0";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "front-check-log0";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@2 {
+					label = "front-enc-fault1";
+					reg = <2>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@3 {
+					label = "front-sys-pwron0";
+					reg = <3>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+			};
 		};
 
 		i2c14mux0chn3: i2c@3 {
-- 
2.30.2

