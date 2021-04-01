Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E86350B4E
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Apr 2021 02:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9kgw5S3vz2yjB
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Apr 2021 11:33:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qeCm50uj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=rashmica.g@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qeCm50uj; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9kgt2J4nz2xxg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Apr 2021 11:33:45 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id w11so101086ply.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Mar 2021 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5UZtMewfW5OgbqLFGn5/mTv4Mc+TTkX7oOVeShL1+uA=;
 b=qeCm50ujxzjq3oeFwx1pHZ/pcNfApAHbxDypYt9HkWgWeCSwXMUPMWXa7ziHkp2qqh
 FW0/9/QbCcFfGEIh0099U3DaW5+LwQ9gv1iVaOFTPpkRbzuSFN3D+V6pYHqqhABURMEO
 s2bhtQFlL3v3xJVnSmabpqfHIMXdRby2TFO+HTtDAVQqZOGfkZrhiIdkKBeOAYCDXmVa
 twVHjq2nkSbKmf37A2Y+TOaFqEFCJRKy238nQjX2MkGbSdc/4bZvo/TgkfQFRcLZULpg
 1cIek3AqVJzMlcHfgpe34i8rvuuBg5ZAkd/h+YJchfJeayOYcZkvnKxm/67QmbFHTkI7
 ISYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5UZtMewfW5OgbqLFGn5/mTv4Mc+TTkX7oOVeShL1+uA=;
 b=gsmvi/wa7sVVlb+sv2xzNi7OU2LJFZ8wNupw0XVDuHfzY8ueFl7cAAQGIi4NJbWWG6
 kZCQKVeme0b96AsPlqoSyVDW2PdYVnQLD9762e/Q/1dMiIzDFl576ialXJR1leUrRjSW
 TvSNwScgiUvdJOLXGYJrlfC35/LrOLOIyeri9Mc0aeIuO/DBHubxzsiEi4MZlttPUEiD
 vIAy9Pq5VtZUayBuy8aEYtE6AKM8B1OIvjPavCyFVCvjtT0GxHlKAYN8UwHXAfgojJOZ
 kwimqFFF4TKPom4SGtjFPn39EDwleRsZgZAYqZRWG81n9yfQp765n4BLfDJDSVyyoo3y
 7siA==
X-Gm-Message-State: AOAM530OuAz3lB72KsHu9PVpWdZ4enbBGLpd8xPtVBh8Pf1Ehno9WLld
 Jewyg2sXMbJ50N+9WYa8WIe9oOCGDMY4UA==
X-Google-Smtp-Source: ABdhPJxOYx5QVUWjNYDsIFvm/eMgV7FGUMZrzDZpi57jE/lKQ+OUS4RSxkQHieDioujZQCTeJxi9oQ==
X-Received: by 2002:a17:90a:b293:: with SMTP id
 c19mr6034997pjr.193.1617237221693; 
 Wed, 31 Mar 2021 17:33:41 -0700 (PDT)
Received: from rashmica.home.majoof.com (150.24.220.111.sta.wbroadband.net.au.
 [111.220.24.150])
 by smtp.gmail.com with ESMTPSA id ot17sm3226099pjb.50.2021.03.31.17.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 17:33:41 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linux-aspeed@lists.ozlabs.org, joel@jms.id.au, robh+dt@kernel.org,
 andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: dts: aspeed: rainier: Add iio-hwmon bridge for temp
 sensors
Date: Thu,  1 Apr 2021 11:33:14 +1100
Message-Id: <20210401003314.167178-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.26.3
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add iio-hwmon bridges for the dps310 and si7020 sensors so we can
access them via the hwmon subsystem.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index fefb0b8fd6d5..7a2bcc373852 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -173,6 +173,16 @@ i2c2mux3: i2c@3 {
 		};
 	};
 
+	iio-hwmon-dps310 {
+		compatible = "iio-hwmon";
+		io-channels = <&dps 0>;
+	};
+
+	iio-hwmon-si7020 {
+		compatible = "iio-hwmon";
+		io-channels = <&humidity 1>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -1972,9 +1982,10 @@ &i2c7 {
 	multi-master;
 	status = "okay";
 
-	si7021-a20@20 {
+	humidity: si7021-a20@20 {
 		compatible = "silabs,si7020";
 		reg = <0x20>;
+		#io-channel-cells = <1>;
 	};
 
 	tmp275@48 {
-- 
2.26.3

