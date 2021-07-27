Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484B3D6D00
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Jul 2021 05:46:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYjQm0y8jz308C
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Jul 2021 13:46:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=osSoh6CC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=osSoh6CC; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYjQh20s6z2yfg
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Jul 2021 13:46:52 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d17so14189671plh.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Jul 2021 20:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHLcyT2UMv9x9MK6U+XqN63IabhXoj2MDT1yv8rmGxI=;
 b=osSoh6CCzu++VYy9WyHTUa3AozbYPB4rx5JMW8RzdYeourWpAi/EjC4Uo259K6m2um
 hCYpKBME/egzzJZKVB8tspFPVYCYU6Yq2Ai2JTVJXeNb8dpkhbVxPCb/3l+8Raa7r2e4
 uH+9XTUt6zd2SAje6TQJ15Jr2qGp6bWInxNRe7TiVoRhG3jpeyp0cvVnTIJCIaRZ99Zf
 glS1Mzmq+bd0FJ9SkzYvcOYM5xlpDOWN1zzVk/NULWtn1nO+5UZamhWlrvEKdEAq3R1P
 X5Tn4aZiKHATbuutq63LMmgmHxn8YxdpQ/XZLrEP6cWsVZnorjWAnqSVAV1H6t2hXYNc
 Tu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mHLcyT2UMv9x9MK6U+XqN63IabhXoj2MDT1yv8rmGxI=;
 b=MInfVlCMDhdvtJ9wiqrcx4oPuMZzX59CZKHoOeWTtp18HhdegGSq+IqIyItpAHeP/9
 hYxibH38SWSXXEMSmes72vD2f5Do4bo+Z033N9aQfSnORUcdPiiRq5LaUTV6yXuMOFZ5
 79qSLN0zwcf2Znk757rrkvZVTTBovzBSHwZzwP5ZBU7AfHzQpNaoSbRH6Ftc3LdxSSYz
 IUFwLxG/qR5uOzXrUyg/w++O5e4TQHokQ72THH4ejdYkxVs6J3Y+Ev956V8lQ+fcdE8a
 3WlNaPmdR6D5+pmUBEuVi0zyMy8kEIwRot0xibRBflBTfpvsGuBofE0VlOjIWiamNGUS
 wrSg==
X-Gm-Message-State: AOAM531pal1lSCZwqpWCCM3QCaRt7v26FHVhKfRY7p5vvj2SLbrmICAQ
 eumx7BrVsId6ZBti8Kc0yzU=
X-Google-Smtp-Source: ABdhPJyIXk7Pt2t7GuKylVXVwyGOUoDgKw3n+IHUW/t9rLUdXT8/P9Ec0s/Y0h66qHPkLaGLbUpi4g==
X-Received: by 2002:a17:90b:1484:: with SMTP id
 js4mr20520710pjb.155.1627357608832; 
 Mon, 26 Jul 2021 20:46:48 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id 20sm1631568pfi.170.2021.07.26.20.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 20:46:47 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Subject: [PATCH] ARM: dts: aspeed: ast2500evb: Enable built in RTC
Date: Tue, 27 Jul 2021 13:16:39 +0930
Message-Id: <20210727034639.474458-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable this device so the RTC driver can be tested on the EVB.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 583a241f1151..1d24b394ea4c 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -129,3 +129,7 @@ &gfx {
      status = "okay";
      memory-region = <&gfx_memory>;
 };
+
+&rtc {
+	status = "okay";
+};
-- 
2.32.0

