Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F334CD3E
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 11:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F871Q1rRjz302m
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Mar 2021 20:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N+NkL0Bv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=rashmica.g@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N+NkL0Bv; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F871N19rjz301X
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Mar 2021 20:43:19 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id v10so9037099pgs.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Mar 2021 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GCO+HLMUHqwP+IidTwyt4nWDFD74p2XFYnz20c69ZzM=;
 b=N+NkL0BvHbk+8P2TYKNJJBjn8k338s2pxeZF2+J5Ud0AXYiYmUd0XADwi0aNi7RLLK
 e81q/O1crM45iSPKGItcAD2JZZZ+we77sM0nrvcLqdLGCv3rG+lSB5AljFFUFIHq2awu
 Q9c2RM8DkcdWhwF9cYDPa3KhSracOQgkoF7kCRUOM82F4BqtndtSPyNs4vnt8jFDh8S5
 nemZKrxDXlpsnJSv7lo+zhIEkXp/xrISrCUPuZoL5tQzwJAm8nkiv286a7U/iBcnpqmL
 mLldh/Sk2Tnh4UIwPlh7wzGiSt1TrDs7I5obVmVXRP2Y8oOoeMIp/gPSwehz+Io1vGK0
 gsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GCO+HLMUHqwP+IidTwyt4nWDFD74p2XFYnz20c69ZzM=;
 b=VG8FmELBsuCw2qa9b7slAe7Lq45AyBVm2ut2uaRjRuG9BBBbzZpK3ma8Rf1wdggV0N
 f1LvAiLtVkDsGMVKU1omnHE3qi+6YistVaVCi0Jh11epTGKA2RDqyVzjYjUH18oxmzj6
 VWIOwa5f3iSpCDEEyRtF3GPRaC1AhM7aeA5tkHhjxULpuCl+BsF7keU8rrdSyW4fhCo9
 OpI324uDV5BtozusFe+fTyrUNhcOptZlW9nTTHhSnXka5D5aPnOeu404NwtY6435h7bB
 rFRubatUCbRyuUGpWGgXDwzyGQ7tXrNfS92a5SXmxTTKcPxhzIB02qTFbuDfDpSJ04pB
 65fg==
X-Gm-Message-State: AOAM53341o0iL8gTdj8jmwLy/+cGRplzuBnzUnj9oRQfjUoxpRSeZjer
 C4vVJJ/DJGy84LychGQnhRL2qga918iB6w==
X-Google-Smtp-Source: ABdhPJykhOXy1F3yQ7v6t33crenlcHFMadoq2XUxA9qPwLfpW/z3mLy27Ru8ch8eCQwmp8u/MFW3hQ==
X-Received: by 2002:a63:4462:: with SMTP id t34mr22756427pgk.389.1617010994285; 
 Mon, 29 Mar 2021 02:43:14 -0700 (PDT)
Received: from rashmica.home.majoof.com (150.24.220.111.sta.wbroadband.net.au.
 [111.220.24.150])
 by smtp.gmail.com with ESMTPSA id q25sm15970980pff.104.2021.03.29.02.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 02:43:13 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linux-aspeed@lists.ozlabs.org, joel@jms.id.au, robh+dt@kernel.org,
 andrew@aj.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: rainier: Update to access sensors via iio-hwmon
Date: Mon, 29 Mar 2021 20:42:55 +1100
Message-Id: <20210329094255.347713-1-rashmica.g@gmail.com>
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

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index fefb0b8fd6d5..2dc72de07906 100644
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
+		io-channels = <&si 1>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -1972,9 +1982,10 @@ &i2c7 {
 	multi-master;
 	status = "okay";
 
-	si7021-a20@20 {
+	si:si7021-a20@20 {
 		compatible = "silabs,si7020";
 		reg = <0x20>;
+		#io-channel-cells = <1>;
 	};
 
 	tmp275@48 {
-- 
2.26.3

