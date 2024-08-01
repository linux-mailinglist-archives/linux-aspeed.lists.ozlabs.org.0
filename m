Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D6944FF4
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X539dqMk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgm0htWz3dT4
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X539dqMk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYgF5m8yz3dL8
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:04:09 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7515437ff16so5425531a12.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528248; x=1723133048; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dzaqkiR2ify4Vskwae+HmUaR4MwIa3K/TPMIOUHQcw=;
        b=X539dqMk8RDcbnOIrZs4I7/oUNnXxffNt4UOddsOcj/E+NRWGTpOvhFAOrrH713prE
         XDe+aqWCQPi+eJjfaxrZZRjTgEcbT+0lA56codJ3t7mPtDsLlQhYRNd6lHBeXAvMf/BR
         sTM+6nAlHus/Vz477GkcE3lEaGsbbFp9foYDlih2GCi0vEhIX5jzTnwTm3lgs4naykac
         JYZebnyWdbQfOTBcQKsfBcJI1uEVfkBh3/hXd54Q3Q909P/nU7lg1SG07CLtpUN6QeGK
         8iW399cc+20f8B2jQYT14pwhUViUetdtNhZeZSZKXQylpImtWj2WzxV5soKWkS0MrOm+
         3LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528248; x=1723133048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dzaqkiR2ify4Vskwae+HmUaR4MwIa3K/TPMIOUHQcw=;
        b=LizAoyDydLBqelSCDFGnItMwdVdj4MDD6Zn8NWwp/pUG0PWpneA3miBYG2rvOdupUK
         ute9Z/5G/MXJT3sS2PujwV/KLn61GbkXredGQEpNaKTM713QBaYtR+Ate/K/rt/TTptO
         IKo7q1qyJBMIa3o52fqxwRA6PKYmbxtMHEM01SGuVmqGfijiAl2a1PhwpDXf/0m+7ujr
         XBD0Z8gFIKJM8JEHcENcuKiDVi2tSNKXttpqcQClk2cljDUAHOvVQKotZqtrgXkeZRzG
         bLnYclyL0WDPWN5e71D+/bIeK2IxYE5dyQubmQ5CBJnctHmPn3ZIlPEF1XjIVdDeluXx
         zzDw==
X-Forwarded-Encrypted: i=1; AJvYcCVh2cX6Pq76fOLjXG+7xil3YxIY5seh8tZd3wGfB/bEXV6hsoHKcHWB9vNbFIrsq0NKB0jrgRtIo67URrfZyoc4UTs7XLwGR/vG0vAC3A==
X-Gm-Message-State: AOJu0YyRMqtYAf2HczjAHA4ChIOtunwZBMygMd9Pt1cqcxROVvZg6VNV
	8GatoD14Io/BUgku6XUqcy802ANMLjQWpmPEfy7SD4dE06ByfZAq
X-Google-Smtp-Source: AGHT+IGZRKqfnu6C1bL7fmLXc0sB0d/soJJoNHZHBvLfRySEEQSR37WC2HqKtNNgef4+UmDFfkXHcQ==
X-Received: by 2002:a17:90a:6387:b0:2c9:9c25:7581 with SMTP id 98e67ed59e1d1-2cff9419cdcmr831272a91.16.1722528248036;
        Thu, 01 Aug 2024 09:04:08 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:04:07 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/11] ARM: dts: aspeed: Harma: fixed dtb_check warning
Date: Fri,  2 Aug 2024 00:01:34 +0800
Message-Id: <20240801160136.1281291-11-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

1. revise spi-gpio node and property name.
2. revise tpm node name
3. remove max-ngpios

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 0dd0566bbf27..4421822eb134 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -70,19 +70,19 @@ led-2 {
 		};
 	};
 
-	spi_gpio: spi-gpio {
+	spi_gpio: spi {
 		status = "okay";
 		compatible = "spi-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
 
-		tpmdev@0 {
+		tpm@0 {
 			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
 			spi-max-frequency = <33000000>;
 			reg = <0>;
@@ -640,7 +640,6 @@ &gpio1 {
 
 &sgpiom0 {
 	status = "okay";
-	max-ngpios = <128>;
 	ngpios = <128>;
 	bus-frequency = <2000000>;
 	gpio-line-names =
-- 
2.25.1

