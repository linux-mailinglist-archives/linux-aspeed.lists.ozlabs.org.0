Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482C80D1B6
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 17:29:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fYUO6QFI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpnJD3T9mz30g7
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 03:29:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fYUO6QFI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpnJ115y5z30YL
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 03:29:04 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d06fffdb65so27346575ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702312142; x=1702916942; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rqtKe4v8UjvBYiGw2tAEywSMjLXJ0nr19S1NY3ev5g=;
        b=fYUO6QFIWK0hxeYK4BkxNdUnjklxIwOA0qEIlXmHrVUTGkHBHJuwk2qt4nOy/hPoYC
         cScWzNCBy34Xl3JsPOaQ4NqE53tCU3Hv+qebdDFiiupnVEoRpJUjYLHa8tXLMGj+HJap
         +Kxg8NQGh/NMkh5rpJOhlAxcR5pnDnOMUtXlnL3gF9OskE04hd7ZmUnv1eFloe40cS5Q
         FXcfYQ+acueB+oNusLG2KpHuKy9Ucl+h0ZPbqv1KKPbFp/UjARxLPWYj1dPvE2EdCXhf
         Bv7qf4TCgobkrKFibATpC8Lj2hMz5Fx6epmWFJRo7mGgbmdHo50VG+5d56GqcN2JcABS
         Zq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312142; x=1702916942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rqtKe4v8UjvBYiGw2tAEywSMjLXJ0nr19S1NY3ev5g=;
        b=OGgpAu7+C5qMpZ/KqBufERVx3iz4nl8W2OCKdB130lByQY2RwNTXRZMSYakb9uhywW
         8VZJoYVXlB9AnzncciHAQ/hrLY7qNAtRyrgf/urKbD5kFsD1/6kP5vdirAzHhI5XINqc
         5XKVU+quxSJIfnFvSpxDPba4ufyZ3hJCxFFVx2hhHb2ZZRQS3Bq0AIZjfVDTiqpSce9k
         6MGi2s1tcmz0uiY10pbWx+Zl+T8oeFoH+4pc68TKHh3v4BOBYfHU5jNc7BuhzlEJJkTv
         eF/XvaiuyjKixl4p7ZlqoBa5Iu4bq5q4raeemHQ7AmW4+MLjHqCqg/5b5FAOh4Zt7U/k
         GIBQ==
X-Gm-Message-State: AOJu0Yz6x6ar3VbaezRmj4wJd8woipLufQzr69c1caBsVlFiTvP7XVpp
	MVhr2k17D5L+qdlfFqDKwJ8=
X-Google-Smtp-Source: AGHT+IE8XpJDocFAKHHGFpxrgDq0ug6k0fy23CqEFOE5ghkrImi45EDoVbTeYgTMYSHYXh2+EvwZgg==
X-Received: by 2002:a17:903:26c5:b0:1d0:6ffd:6e4e with SMTP id jg5-20020a17090326c500b001d06ffd6e4emr2234953plb.70.1702312142392;
        Mon, 11 Dec 2023 08:29:02 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id ja1-20020a170902efc100b001d04c097d1esm6867888plb.271.2023.12.11.08.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:29:02 -0800 (PST)
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
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Meta Harma board
Date: Tue, 12 Dec 2023 00:26:54 +0800
Message-Id: <20231211162656.2564267-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211162656.2564267-1-peteryin.openbmc@gmail.com>
References: <20231211162656.2564267-1-peteryin.openbmc@gmail.com>
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

Document the new compatibles used on Meta Harma.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e17b3d66d6e5..fac3cda3f487 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,harma-bmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

