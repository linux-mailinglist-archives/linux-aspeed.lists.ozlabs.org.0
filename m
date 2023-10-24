Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F77D49F7
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Oct 2023 10:26:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bRf6kPap;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF4sd06Pkz3bv3
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Oct 2023 19:26:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bRf6kPap;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF4sT0FPvz2ygY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Oct 2023 19:26:36 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3311865a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Oct 2023 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698135993; x=1698740793; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5HsDJmJwnWYwNcgba3tsjKA0OTu3Q7BjazBfQxf4vY=;
        b=bRf6kPapnfl/fI5RNo4RH/gy/X7V3H2OEC/ik/94pKJUqQQJRRHiwspeg5x48+gAgR
         As1VClPuZxJfWGyjJm/DMXNR/ZfM5kDvAElqcnI6S7Gj2tUecmNsQtwjhw6iX8NKPvQG
         hPNaMTEoLJOCVjeijSMLhwRzTg8W0JALQt93pZA0keY8yZLFpHCYjCvjdA4LTavY8dBQ
         BejvYlyRBMGmlZgKo3SMy1RCSiExniDtWPcegudAEpl8CaiCbNb6U0e1CJwZEaRcT4KX
         IIrsLSmO1ConS/Z/xSj9WM6FK0mkeTGhJxFj+n5cX/QgvynU043hcJz5yYk9AJokPlhz
         UTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698135993; x=1698740793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5HsDJmJwnWYwNcgba3tsjKA0OTu3Q7BjazBfQxf4vY=;
        b=PoglezxjNFOWAizvkzqfMr5bFavnXdiBB8SDAzORPVhyovLHUXRNurrK6PmCmE0hqz
         V5Ca0wp4uFqZD+Eezg5TRZaI53ESjZC04+8a2J4Vy+OvWo0qlZRRY0Uqoq81RY3R2pw0
         wI9T/mKKY5rLqKTH2tTYSb8zOiQgZS915yLH0f/MqlwGeG85xZJ7cSBfuUADYkLJfnsh
         W8qdxG7Nqd517FQEDE7YO0kY/5yTbEavsxMzis21prTX9DOU/m25BxIpqckc1ko7fQwI
         zmst4z+fFSeR+hpBTKT1kopoxUe9GydTWU4i2+qAT0BLPja2PwpX8VWi6ddnRwFhFd/9
         Lqmg==
X-Gm-Message-State: AOJu0YyZtGz+zgG6ygLK+U/Uelo6wMqJIPfyiBktC80o21NT2lCzc9/p
	9NpPTi8oOZ5l2Jf5QxIYdT8=
X-Google-Smtp-Source: AGHT+IGyzh/DfOCSkLkHkMMuir+TVP/xzaShJOMkwYLNlIBfZedRdzGVU/6JPkRfnesZ2ORkWiWnXg==
X-Received: by 2002:a05:6a20:8e12:b0:141:69d:8041 with SMTP id y18-20020a056a208e1200b00141069d8041mr2499437pzj.48.1698135993637;
        Tue, 24 Oct 2023 01:26:33 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001b9c960ffeasm7010665plx.47.2023.10.24.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 01:26:32 -0700 (PDT)
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
Subject: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Meta Minerva Harma board
Date: Tue, 24 Oct 2023 16:24:02 +0800
Message-Id: <20231024082404.735843-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231024082404.735843-1-peteryin.openbmc@gmail.com>
References: <20231024082404.735843-1-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on Meta Minerva Harma.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e17b3d66d6e5..20e3be8d8c78 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-harma
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

