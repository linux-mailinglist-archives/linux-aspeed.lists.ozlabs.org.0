Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E166586B
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 11:01:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsNW16tQ9z3bXv
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Jan 2023 21:01:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ffufMZqP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ffufMZqP;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsNVw4lWbz3bNn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 21:01:27 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id b3so22729635lfv.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Jan 2023 02:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UcPP1o1gIQ+AMRWHqG1bQnZMuMeBJxJwuShgYMSMgt0=;
        b=ffufMZqPn9j4XMdmTfRy4HXOM/0aobwJqcZqFaKxKgHTHqqfhkXqNILCiqI4MS7MjC
         gjHakG5xZUBS/5Bsnrrtd/alnbgNgovRk5mIUAkfl0w7tpEFHZ6PNKnbszX30L5rlpmZ
         eeki6YcXxJi7k2jPVRmzV7spHIAZotaNzaXEyznXFIgy3PsdbOQYdd91opfDFxPkqVuW
         y7Z8hL9DM+b/OxrbKKA5OJkBUFymZWsumyq0ZEcOA5AW3c0TdRfph+GehYBe+iE0Rcs5
         AhHn9fy1aR6Skd9RejGd2JSs4kuG1GeiR7SIxISjkVlnGS4u/iHdc96DWh+xx+xE+Io3
         XzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcPP1o1gIQ+AMRWHqG1bQnZMuMeBJxJwuShgYMSMgt0=;
        b=FWvlhL/G623qlXWVjOumJgW6HQ0HyXNtSs4K59hScr4p7pgOphCZKXfsgwvuf3Btwc
         O+ej+DkK0LO4eHAmvLF5Jq9UyR2rKjGR0z7+Tneac+l+vVWX6gpX1GpK6YAKr6Vj3hGO
         fSaHqam6190c8ME1edOiPySh7qjYUZXZx7t2cwdOoWfXBiyWpg9FlAv/S37wbIAm3G7J
         /CGGCP1pp3jbdeI9YCnlPxNUvhVLiLJWrDzAnvQ18xtUWA43cFDfHhlCEl9A6MwlsMxn
         i+YHhZp/kb28rlbc5xbNn1WRwGRVCe0z5KEXimgA+eMYLtOPC0uD7aZsDdNVR6pqfLsd
         soQw==
X-Gm-Message-State: AFqh2kqMstimZ8gH6+2dKoxJ1zPHisP76AxoFGAMjVh+LDkS53s3kWZ0
	m61vTY6h9Z+WTCbWfnw1Jr4=
X-Google-Smtp-Source: AMrXdXswH9b2Rs7IxM4ginoS/QJlALNbfLOGneEgsNiokBvV2y6osnwzATUtkvkZcZ2ojGluW4a0/w==
X-Received: by 2002:a05:6512:ea2:b0:4b5:5bcc:cbcd with SMTP id bi34-20020a0565120ea200b004b55bcccbcdmr21135950lfb.0.1673431283017;
        Wed, 11 Jan 2023 02:01:23 -0800 (PST)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id p37-20020a05651213a500b0049771081b10sm2653199lfa.31.2023.01.11.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 02:01:22 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: ethanolx: Add label for the master partition
Date: Wed, 11 Jan 2023 13:01:04 +0300
Message-Id: <20230111100105.707-1-aladyshev22@gmail.com>
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

Add label "bmc" for the flash master partition. The master partition
is required for the firmware update in the OpenBMC ecosystem.

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

