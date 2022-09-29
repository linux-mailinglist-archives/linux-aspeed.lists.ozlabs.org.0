Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4F5EEB00
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Sep 2022 03:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdG9N1Jttz3bvl
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Sep 2022 11:34:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NNLGLEC/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NNLGLEC/;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdG9D3b1Gz2yWl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Sep 2022 11:33:52 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id u12so5288153pjj.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Sep 2022 18:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=A78/h1Yexl7Q/hTxPF37Ok/UONpxdO8dwh6yuAvjHaE=;
        b=NNLGLEC/GijEfGayOwrdysIhBGUN6hZimivsHLoPSIXzx7CHRS8+TYcFftyeoMVVgV
         AlQRuf3NXs64o+Z472U+3zrYYM12aXQ0mZyEwb97haD48mls9exboEHKV20BK5hP4WI7
         3wVNCsE68ZR/5S3Jkiu4Bh9iBtueQ19SYjMDUsah3FFuKBeGCYYbbnIhZUFCKfe+6/e8
         Y6SqA9h3TQD7uC6ZaGmmMXOk0T7UCkk2qUun2e5p4psmg4TKILBKLUMaetlPLmgUOsd0
         ka3Cecj93snUkuIorTJAAb3tOFa9GsBNXJI/+QnXVqdPP1B5caLfD5UxcTvK59EpXCdj
         qAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=A78/h1Yexl7Q/hTxPF37Ok/UONpxdO8dwh6yuAvjHaE=;
        b=Tc3Le5/RB1E6xh0K797hZi2uHgX9WuweBRQUu76/AAKbSFkZ2aQQDW0Yo138SGWajd
         yxH0JtqYqerond/ACrx9boH0egpgX4F1oTC9AkD3JPyTz/QI6AA+G1P9fqQCHPPw85h/
         5KupTvvlaJTfCAi6adClmN29dMesl8gFOFflUumLcRI/8Q4uMKpdC1Sg6Yo6IGWs+JV6
         Mv3i40Nb8oq606bsVByODIbpPKcFu/TXoiG7Ro7tgkP6U57xvL6ipESJ6SGtLwv3xXG5
         FmqiHCAAmvoZJ8xmRFkqc5NlG2OvTIPXwdS48FCMHvC2Tx2Iuv1NpgdyRtWT7pBA4xZs
         4ivQ==
X-Gm-Message-State: ACrzQf0lgywr1BVJSqQ6d813xJrcp/Bo+xcUGKKQPwvyxVXgfyDxsgFL
	eOwgl6FI1PRsc6623fon4yY=
X-Google-Smtp-Source: AMsMyM4wIjgz2FTKS0abEguNm0kAB61a/hyGThRFcFbfCfPZ0jHRtBscxBjoOlEpM22JvQVfP7Arig==
X-Received: by 2002:a17:902:d70e:b0:178:2d9d:ba7b with SMTP id w14-20020a170902d70e00b001782d9dba7bmr916995ply.90.1664415230256;
        Wed, 28 Sep 2022 18:33:50 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902ca0300b0016f85feae65sm4385587pld.87.2022.09.28.18.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 18:33:50 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] ARM: dts: aspeed: bletchley: enable emmc and ehci1
Date: Thu, 29 Sep 2022 09:31:30 +0800
Message-Id: <20220929013130.1916525-3-potin.lai.pt@gmail.com>
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

Enable both emmc-controller and emmc nodes for storage soultion on
bletchley, and enable ehci1 node as second storage plan.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index f5986f5909cd0..a619eec70633a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -1046,6 +1046,18 @@ &ehci0 {
 	status = "okay";
 };
 
+&ehci1 {
+	status = "okay";
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+};
+
 &pinctrl {
 	pinctrl_gpiov2_unbiased_default: gpiov2 {
 		pins = "AD14";
-- 
2.31.1

