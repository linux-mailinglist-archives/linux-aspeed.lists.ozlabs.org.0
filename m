Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6805EEAFE
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Sep 2022 03:34:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdG9K41VPz3blf
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Sep 2022 11:33:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jAF6Kl+K;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jAF6Kl+K;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdG991gTsz2yWl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Sep 2022 11:33:48 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id y20so3109940plb.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Sep 2022 18:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SCE7PjRLwj6A9cf3VX+SP/oH5MxVVQmwgQMAjTSH2Qk=;
        b=jAF6Kl+KBatJ4TdNA+yUuC8UMdWGlXX5zL2vFLW3FLtFt6xZw0aqGLwM+vyMMW0aZX
         dMggX1U42LMu6YJFLqtp9Ucdfg57nn0Cvi642Ld93JaRXaRhovih4/XWQc2iLi2VLDqr
         b4WpbpZ1OgwAtQ+vI5nNCawldyNp36KT4JzOHFY4rM4CF9Zg9IwJNRmftaM3AbX6mByO
         5AFSKv8GYFXw9joJ2tOAbBp2yMozZnhBCFWHaTyWRp/uBFYUDms8FqdT6vWHUf1e6VJn
         0HBmWV/glteO3FxFDFBx3cegX0TcLX8nr+NjehAOl9ojY15iOJ8t0+3hcK+IS2uvUOac
         /nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SCE7PjRLwj6A9cf3VX+SP/oH5MxVVQmwgQMAjTSH2Qk=;
        b=UfMvZG26K3bZWsIqw85eh/OS+IwbwDqWE9ihZ5iaoroQOn81iQRphr/JQ1fqAGOLaU
         8aN7287sMuOPGfUAPheKjsnbfa2x0f2A4sGdnMDyfnmHQHxWg0ulP7Y1GmFFRmdnfO5G
         jO9ai/FOLmD7GSE3agSLxQmmWxsi8hEUBzXE83reYiSlcnWVhUZ/v44muhsesXCqIP1Q
         KjfXveKhndy4R7u5aMblaujbmLmC4oJ5P4Se7oKIHjvI4h80wrhXdxNpTpq5XpIDppgW
         4Na5UmwzAx6XmxVK/nXAWwFbmGs9wgkTmcFA6Si6yLZ8YyPvNVhhC5wGrv8ynJ2FqiNY
         HVlA==
X-Gm-Message-State: ACrzQf33tTxPBqF6mWeSVCTPQQbWVczWUZFR4Qs0x1YUCmxNAfXe4qn/
	QTax4hpwWCoZHQnj+X48h38=
X-Google-Smtp-Source: AMsMyM47MXtDCAX2ikBp1yZXTWIPood4dSA9Pz+ro+u16jHFVf9tdhjGaHL4tvO9itCSAKrNkXFuYg==
X-Received: by 2002:a17:902:e545:b0:177:e335:9757 with SMTP id n5-20020a170902e54500b00177e3359757mr886201plf.152.1664415226760;
        Wed, 28 Sep 2022 18:33:46 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902ca0300b0016f85feae65sm4385587pld.87.2022.09.28.18.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 18:33:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] ARM: dts: aspeed: bletchley: update and fix gpio-line-names
Date: Thu, 29 Sep 2022 09:31:29 +0800
Message-Id: <20220929013130.1916525-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220929013130.1916525-1-potin.lai.pt@gmail.com>
References: <20220929013130.1916525-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update new GPIOM7 line name, and fixed typo of GPION6 line name

New GPIO:
- GPIOM7: USB_DEBUG_PWR_BTN_N

Fixed GPIO:
- GPION6: LED_POSTCODE_5 --> LED_POSTCODE_6

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 1f72017c1e2d9..f5986f5909cd0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -984,11 +984,11 @@ &gpio0 {
 	/*M0-M7*/	"ALERT_SLED1_N","ALERT_SLED2_N",
 			"ALERT_SLED3_N","ALERT_SLED4_N",
 			"ALERT_SLED5_N","ALERT_SLED6_N",
-			"","",
+			"","USB_DEBUG_PWR_BTN_N",
 	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1",
 			"LED_POSTCODE_2","LED_POSTCODE_3",
 			"LED_POSTCODE_4","LED_POSTCODE_5",
-			"LED_POSTCODE_5","LED_POSTCODE_7",
+			"LED_POSTCODE_6","LED_POSTCODE_7",
 	/*O0-O7*/	"","","","",
 			"","BOARD_ID0","BOARD_ID1","BOARD_ID2",
 	/*P0-P7*/	"","","","","","","","BMC_HEARTBEAT",
-- 
2.31.1

