Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90887868649
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:47:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aXLpAwJ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL341Nqdz3cVd
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:47:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aXLpAwJ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL2r1QLpz3cNl
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:32 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dcab44747bso10714365ad.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998450; x=1709603250; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=aXLpAwJ6gJ+GaT+H+ylJ6DE5JFARDlHZyvNg7Z2LB3OYdluL79uBHygOe5HljkSbeW
         u1+k+JpWEGiSbfHbarHEWm/48UVLCK6qpqviA3mM3tlx7eI66cMcFc0tfpIw2za36Rup
         NgaKc/2V7aaokSY9eU8oDyIZxg6lz0nI/epzyEqarOpaABosNXTuM/dLk6Axy4zRn5YT
         WDECAcU4Ciq5URVlP8CkQlIKep4V+JwGRXUiGdpCBz3oDuTJnXlP5wvv+bi0Mcl3rCHH
         q42yTgUZFGtUm8dyBiU2OLlXUIjuUxwUV2xZZDcJnrNnenysFcZk8cV1uMTtRJfyyb4M
         orBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998450; x=1709603250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=XQe8UuVOcwkv5EmvN4qv+Ob8JJXauNYKSfPiM3sMQqJANht4M1QQXGfESeJASgpQBp
         mjTjRuee6ZDylpuuHp353z1m8y4H/iTAB6O7UWnbYL1gnHp+K2LMlVzVVgZMiSToG84R
         YOr/Esp6r2MBuCeqccm01QtkVkJEITCfiNWZy9a3qzrzfGq4kfZjm2H3fci+Zrj2D4wV
         CPQrZcqnYhbKi06OYzSIP+dain+gvU416M3hgxq8G0LiS7N01+4D6fpPJnG0PcrjtdQC
         LsoP+xDZgxGks8WTlu61GI4FITpPkEYfT3K28g+g2GRz2cJWcWybmm6JWxCorsGUhxsW
         +www==
X-Forwarded-Encrypted: i=1; AJvYcCVgVNp6Trutcy1kSJubnQYhuiN/IM1CEP6uWXcYzBDaQ5YLyWePWCpo4iNHw4IY8ZhzhZgIS+oCR97qMmtfWVZZvaO1ZMiBxIJwsviqfQ==
X-Gm-Message-State: AOJu0Yw8IhruZ1QG4KRAgJRdQOmDPAhvq0m0vDcKu43RzjRn5Ak8vaEu
	fezpQLtnq690XMbmC/3T8VTdIJVo42EHrjNZClOPSJzkL5O5bKOW
X-Google-Smtp-Source: AGHT+IEuY0YS9uhhpwyMcXgTwdMTh5gphqL/4vO6O7j6X7sRqCr2NuHIC/jNJLySO4qn3fn7Qq+ouQ==
X-Received: by 2002:a17:903:192:b0:1db:4245:454b with SMTP id z18-20020a170903019200b001db4245454bmr10101016plg.57.1708998450196;
        Mon, 26 Feb 2024 17:47:30 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:29 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/10] ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
Date: Tue, 27 Feb 2024 09:47:11 +0800
Message-Id: <20240227014719.3037588-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Change routing to match SOL(Serial Over LAN) settings.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 8a173863ef24..a0056d633eb1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -12,8 +12,8 @@ / {
 
 	aliases {
 		serial0 = &uart1;
-		serial1 = &uart6;
-		serial2 = &uart2;
+		serial1 = &uart2;
+		serial2 = &uart4;
 		serial4 = &uart5;
 
 		i2c20 = &imux20;
-- 
2.25.1

