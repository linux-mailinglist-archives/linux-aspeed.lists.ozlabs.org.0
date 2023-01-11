Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C8665B3A
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 13:19:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsRZB63gjz3c7J
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 23:19:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YeIjkL73;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YeIjkL73;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsRZ51RzCz3bWF
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 23:19:22 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id bu8so23212476lfb.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iC5Tm3f1bIyIFR/SNMJvXCgdTLuVzDKlqQ4xdi94zMc=;
        b=YeIjkL73qjiBNqZcNqCIWv3VfCydmTEmjEfQTKQU7PTKOaCzIFsgYIscICX3JHz6XJ
         MIWgvpCYYuFXGJnBu9ex9yYfswihiFIrhKvEAAg9fgAJsxlMp6roaKMMe+6qQz8QDui9
         WxAB1cdROtn34/7PCE80aVJBCpZYEl101aC2GrUe4P3pA7fQM3CpkuqrTXBm/JeCgOoJ
         VFrneKecW1weCXNYiV9NeEpmEeeCU0dCtAOnip/US5BfUYZnkEmExWxdRsd+hkXDtLfJ
         ghj0XMJ+wn72EGOapIqjCMYGCFMO7xCr6e4J8iqBKNYbnkza0YL7syHaZai2W9lrgnVH
         5hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC5Tm3f1bIyIFR/SNMJvXCgdTLuVzDKlqQ4xdi94zMc=;
        b=oCitnDa+eXUVJryTgTK6QjyzEURjcdssBt7VCpT4ZIeARG2dXDyhJ5aIbS1tWS62E4
         Ezx5ZXFn8xDILsOaGrDk4v39jbpS7fOYOmAaEC3sor32YTvmlTuUYZBQuZYlTkxw60ep
         TPYwJGyztdYNtIGRE7BtWeJmY80oCbca2HwYBK1BQnzZYSk2HT0UcOVvLhJRMF2w23to
         MLA4ydpRdlxuPyc/Gz7xXs3XmFHWLP7dAvGt622tTjRO9HCSe+uOzkWPge31qWS2Ffwl
         NKVCvkWSLw9EqjMJyVQuwvdjpG9DqhiIRbWLWETywWJoNBpFmBHI2U2FKggbS6BRd4xm
         bSzA==
X-Gm-Message-State: AFqh2kqQu4+2lcSXVToLS+4x5MfTXkfJs/yJJr/+WgLSYs9jPb4u89P8
	msNpFDj49GKiqOLcARGc8w0=
X-Google-Smtp-Source: AMrXdXt/35t0+3ucLLkQao5tN+iGBAwNJg1p5KDkdOIcCLnfQqPY3oznuDNR7dPpDy4v4d94rH5Ldg==
X-Received: by 2002:a05:6512:2349:b0:4a4:68b9:66cd with SMTP id p9-20020a056512234900b004a468b966cdmr20243785lfu.24.1673439559709;
        Wed, 11 Jan 2023 04:19:19 -0800 (PST)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id f14-20020a0565123b0e00b004b7033da2d7sm2701530lfv.128.2023.01.11.04.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 04:19:19 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: ethanolx: Enable VUART
Date: Wed, 11 Jan 2023 15:19:17 +0300
Message-Id: <20230111121917.1636-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Konstantin Aladyshev <aladyshev22@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable Virtual UART (VUART) module. This module provides virtual serial
communication capabilities between host CPU and BMC and can be used for
the Serial-Over-LAN (SoL) feature implementation.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index d8e8fca44c78..6bded774c457 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -5,6 +5,7 @@
 
 #include "aspeed-g5.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "AMD EthanolX BMC";
@@ -275,6 +276,12 @@ &lpc_ctrl {
 	status = "okay";
 };
 
+&vuart {
+	status = "okay";
+	aspeed,lpc-io-reg = <0x3f8>;
+	aspeed,lpc-interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &pwm_tacho {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

