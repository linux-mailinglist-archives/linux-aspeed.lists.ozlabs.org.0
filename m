Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D275D547381
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 11:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtbH5JkCz3cFF
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 19:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=doW1z+6h;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=doW1z+6h;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtZl72BCz3cFJ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 19:58:55 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id c4so1919059lfj.12
        for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GocDLkOsBawPMPs9zxnh8PppBX+pbvR6afOC4S31yoY=;
        b=doW1z+6hB6tGbJaAuf6+XaOYEYEK6Z4PL2eTxqpdP4QCs5ULJq/efSF+oyq3Kta73a
         RVY49pzTCOeqGp2LS6PbBst7Rm/T4MNaqJL8E3G3mZAAtkp5WzS530bJOiLOSArgenC8
         gHV4237SNtmyRZ7b7r8cDqRJpLkrhoSahvX5QAIoCTISXslz3wYp76JIYw1R6ie3ktDe
         BaGh1hECtRYvyqmJ6kUoCAymsjbX0HnxzyBXrv8AZ7lOvN70LG1lfwzAyycdkyCdmQAS
         pUA9Yh80WnXbf2V/dDnvUiHsU2kkMQXyMVQV7bm+IvSR/YbbQmv3os2P/pnqg+oxjM5x
         9/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GocDLkOsBawPMPs9zxnh8PppBX+pbvR6afOC4S31yoY=;
        b=lrlJZA8s5VluGYsI6ZM7dHl6b+gagjd9NAgqC8qV4shrXj6vwUcOWgJlYF3W2YyMYp
         uXuiBuOqmAtBky0dGI4D5VUbs1sKSp38wqlnTPl+RpKDud9armU3aOw6coboydy1epzT
         GWpGZf1WxJGDNKrgwaw7j8+H6fv9GOly/0xk8FDZaqpmRlLQ5D10LoN6D54AN2WBsdh4
         B8oqgIVITt0/s/gBBWscoN9MDmipQSwbF8kmTq+Josi1cA4m+mcujbLFhPtLHR/cLlN7
         ikBckurx1TQWSHg9vCXjCTkYj06Ha829LXXGSYU1GFvl6e1Hk+IzexP0/UlhBGOvJ+JK
         Zfnw==
X-Gm-Message-State: AOAM5315ORPgDNuQfe2ANHsJJsksa7b1mUNaOpiHoo3kuspC+rAHGnis
	n1dt0UQyfrtLfZZYM/8StwNkVIWgygc=
X-Google-Smtp-Source: ABdhPJz7uF0meF9LfuCvFt6ei/jXgipBVoJLu6+lz1yX8HSTxLLS96KPAaoJdHDr0fQ15JO+Vjj15g==
X-Received: by 2002:a05:6512:b95:b0:479:65bd:ac2f with SMTP id b21-20020a0565120b9500b0047965bdac2fmr13223105lfv.445.1654941532235;
        Sat, 11 Jun 2022 02:58:52 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-90-154-71-254.ip.moscow.rt.ru. [90.154.71.254])
        by smtp.gmail.com with ESMTPSA id h18-20020a056512055200b004785060bad6sm200634lfl.201.2022.06.11.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 02:58:51 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 4/4] ARM: dts: aspeed: ethanolx: Enable VUART
Date: Sat, 11 Jun 2022 12:58:28 +0300
Message-Id: <20220611095828.1090-5-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611095828.1090-1-aladyshev22@gmail.com>
References: <20220611095828.1090-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, aladyshev22@gmail.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, supreeth.venkatesh@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable virtual UART for BMC<->Host communication.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 428fa9f673f9..90feac5ec628 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -5,6 +5,7 @@
 
 #include "aspeed-g5.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "AMD EthanolX BMC";
@@ -264,6 +265,12 @@ &lpc_ctrl {
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

