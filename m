Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAF4A3C46
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Jan 2022 01:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn8B00WqDz30Qq
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Jan 2022 11:31:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20210112.gappssmtp.com header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=N0dh3y0R;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=clabbe@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=N0dh3y0R; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl06446k3z2xs2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jan 2022 23:20:08 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id e2so4465029wra.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jan 2022 04:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXCJKgua9IOP7ZZ8L1T8exfDe6Y8hRB/10rQrO1fO5g=;
 b=N0dh3y0RnknkW67MgC0xj8N9weplnujuLdrwLC6ZvhPm09uuZk8svPLAeIl4PMo6Co
 1pDmIcCZkyXAwHF/vHcDnWKmFFAcj/lQjCT0oVRzRzH0u9jOoyxG6w58j7Wy6ZyI3QjJ
 ZeVS61oau1VpcnIG4fJ6mdgP7BCZ9ZAlg+7xDGCLTPA1SEpZf06NOS/pb/Q5QIlSONXo
 +G1deNf+iZUqm9DfZyu17R7EsU2tBR6BzojYdwVOA7Bfza7AGH/aSmbo7of/343a/KDt
 ILoBzBk9YEnW1+nMyDemjpOd9aqlSI0vn79xEkgyRhgZDKChcFsqibEB29HSw9uktUKg
 MpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXCJKgua9IOP7ZZ8L1T8exfDe6Y8hRB/10rQrO1fO5g=;
 b=PMMi4uVK0kCLr2asnJIy4xR4ocFO22XDczu27U3mozgi3qEh3dk/3pWe+HSdB9mnoL
 21iYln/+SXcsUxACP6PRz3HNsYmWVK4Ylk4XMK+eZ+1rccZ4KEoMnnKDh0V1sn83T059
 QtYc6Mro9BG8bEPRu4zFijiV5Gv0CKhFBXAGHpb/XYyrT4KBIM5T8StU7CBa8wL2xYT4
 xCSrl4M1WETfaFCunOwpqIgsFWShhMUg3uEYQU0ST8xQVrn3dbCfzymFUM/X7HqysCna
 iMFNDjAfljOsvhbEsYPz5s0SxRG2ySjMEApxMRapMRQcgoCUwHcD9H29+sVJYxUOk8pt
 yEHQ==
X-Gm-Message-State: AOAM530wpagkmIgCRXQ+lk75tW6FanskGsWBDK+r40BM2EmHd+QejZKX
 Gqh1Sf7e8AC4cCOsmYnK0ka5bA==
X-Google-Smtp-Source: ABdhPJxVl9w/ppxzzdHkGN6KP7X4FtTENzJePI8kGhbvQD41pVUSXbgeSl1GJR63yU5x4Xxi8q1nZg==
X-Received: by 2002:a5d:4888:: with SMTP id g8mr2846429wrq.555.1643286003962; 
 Thu, 27 Jan 2022 04:20:03 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m14sm2584465wrp.4.2022.01.27.04.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:20:03 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: a.kartashev@yadro.com, andrew@aj.id.au, joel@jms.id.au, robh+dt@kernel.org
Subject: [PATCH] ARM: dts: aspeed: remove unhandled fttmr010,pwm-outputs
Date: Thu, 27 Jan 2022 12:19:52 +0000
Message-Id: <20220127121952.3985981-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Jan 2022 11:31:00 +1100
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
Cc: devicetree@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

fttmr010,pwm-outputs is not handled by its timer driver, so this
property is useless.
Fixes: 67ac01d03862 ("ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC")

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
index 1a5b25b2ea29..43af63910571 100644
--- a/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
@@ -166,7 +166,6 @@ &sdhci1 {
 };
 
 &timer {
-	fttmr010,pwm-outputs = <5>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_timer5_default>;
 	#pwm-cells = <3>;
-- 
2.34.1

