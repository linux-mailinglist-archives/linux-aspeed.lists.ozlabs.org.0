Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F754737F
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 11:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtb94WM2z3cdN
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Jun 2022 19:59:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TC/HfOrV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TC/HfOrV;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtZl6PRyz3cFB
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 19:58:54 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id a2so1955193lfg.5
        for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jun 2022 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C93TNgs3tEMkjRGIc4zQyQSLHKj4wajnsAJdSQ715T4=;
        b=TC/HfOrVTyr9dht911B6WyEVEETgffYiwjSdsWhhNbTnqcUq/GmMnj85tfMJpHKJ54
         8lTzTeJR1UQqQbJHSYxhunhJ1eaaS7dnT1NbiiMzzsgRDBKSjyvDJyCX6OwXzmmhHmh7
         OcdG1D00tvereTAB6g317kOi36zTyygl1wiNErlzuIMhO3Dj8DapgNDRihg/tNuI3ds2
         GrQ00+6wMB5J3loW4lWEVflR1QmKYbb627zhLEwgST10z2U5Q2wGWPYmNUAoCZZUWUi2
         9y+Up1t5iqr8N0GanPfJiV2q/pHD8+I2JKuuecwTYih4E2G0N2YBuALQMclz2s05+H4d
         c2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C93TNgs3tEMkjRGIc4zQyQSLHKj4wajnsAJdSQ715T4=;
        b=ZaNfYHpkz1JcE4dQdNHcOQjE7HR6Lji+VZhBeravCn0t2sXeytwrX2vDW9yrOi7BFr
         ZxHpK9+5i2l/a3eIywkRhbGtw/HwQPcDsokm8SKwIBWxXoC/sohVncENmRftltwQq6+G
         x6784iM1sOvE8p9xzyheNHDATpPzWiDZJhN8e+jn7tq8P+8NjK+uPVgBRi/qdxnPTmhQ
         vCssHHhXQ7GsL2q/4/c0QS87YrY37cQ1zLhD5Atu9HsN4j0KPm6bnQLDLWIM6FMHkgNG
         lVv6LRMS5Qc/ffMU21hgeD6MjpacXVmZ5RcoPTCPGAkHgg+izx7o2UP0t3N2MvVB/B/j
         6blg==
X-Gm-Message-State: AOAM5327oRTFYreSdCXo7nnf5iUobp8vVd02T2ZWoWjmrU3onBGcCVgF
	MMz+xvfp76DbHBFhHZHMhn0=
X-Google-Smtp-Source: ABdhPJyW9Vpw8JSAMpHkEpi5Oft1TkEZC/FsxY6pbNdui2qL9dmT/mecCiJCFx6hLubZ/sI+6Y9bFg==
X-Received: by 2002:ac2:4bd3:0:b0:479:3cfb:72e5 with SMTP id o19-20020ac24bd3000000b004793cfb72e5mr19651571lfq.516.1654941528155;
        Sat, 11 Jun 2022 02:58:48 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-90-154-71-254.ip.moscow.rt.ru. [90.154.71.254])
        by smtp.gmail.com with ESMTPSA id h18-20020a056512055200b004785060bad6sm200634lfl.201.2022.06.11.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 02:58:47 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 1/4] ARM: dts: aspeed: ethanolx: Add correct label to flash device
Date: Sat, 11 Jun 2022 12:58:25 +0300
Message-Id: <20220611095828.1090-2-aladyshev22@gmail.com>
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

The OpenBMC code update infrastructure requires BMC firmware flash
drive to have a label "bmc".

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 6406a0f080ee..889b2fdd19cf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -58,6 +58,7 @@ &fmc {
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
+		label = "bmc";
 		#include "openbmc-flash-layout.dtsi"
 	};
 };
-- 
2.25.1

