Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBD4929B24
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jul 2024 05:47:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M0afvWYs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHVSj5JWXz3cVS
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jul 2024 13:47:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M0afvWYs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHVSc5J4pz2xFn
	for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Jul 2024 13:47:43 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso18158575ad.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 07 Jul 2024 20:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720410459; x=1721015259; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dD8EVl2OD2lKbICm6AWgZ5uplW/zFGU233eXdZiblYU=;
        b=M0afvWYsp1h6WXgu7EU1O3IXHEIEVv4JItOZefUQdaqGgUIu5DWswfz4KOqHuexbQd
         S9xA2RgYwQ1dZ7GX/AmeuAvPHQWb9Mr7SvHRGpTK2qs9YqVENLeW5eSUkLbkBEDKeCKA
         +NW4yDj8FXs28wLZubLdnYoZqmSIY+LA98Cmb+n1g1p0BAbngMePl16/nWJIUgoG6OBR
         tYwZ59H4AxV9UiRhv2WFrXIqoBmT++wTaWSY4OArcIlcpXMtERQoWNcTO7H5psaRyxGI
         85v+N92pPwvly29joQgs2r2Kr21CcCNDhKDE5rlGwTR9djEBCMfMds9t8A9JqJkDA3Ay
         ukEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720410459; x=1721015259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dD8EVl2OD2lKbICm6AWgZ5uplW/zFGU233eXdZiblYU=;
        b=g1LfPtkZzmm+8as6k/rMh4KJMQO0lc9PiJOslvBw0JvK4KY8JUaZ8iVYsgmKWIbFgJ
         ZqiwLgi9zthB9IZjrI2yX/jZz+x8XlUr4fq2TrrNhU9hEBg4vsjSQqDunAbmAw5bKYwd
         7f1e4ZTxrF15gz9Sbvuhb6KTpTl+kCswZA7Zi1dpJoaKXhbOQj8oYg9zSGve4/bPpey5
         p37wvQfIMyTF7NzPgO/gRxdRB37sirE1roMbi34VPmZOd8fOA6O4VwzeGXJcKmLWNkPW
         Ar+4btQUri1t0uQCUqnJpdGVLoF43mFSpgYnknCmIJe3QQ2f5watEfH1ykoSdIBYN7Gz
         V4Ag==
X-Gm-Message-State: AOJu0Ywdsy12yFZfEdWAUzjWu1nkGxD6OyiMA7/asNlKE7RI4LHf6+qd
	ZESsajhGgrpCdW1B2CdCVvYkCoHthy5UlmFb82pj7GojgxNrml00phDXiDTJ
X-Google-Smtp-Source: AGHT+IEfhNewiFkD9qCPnpsxedt+bsoXU61Lo/i8mRnWBWH1fjPCfpRQcvs04bkLIWdMuqKfKSGrxQ==
X-Received: by 2002:a17:903:2444:b0:1fb:798d:b333 with SMTP id d9443c01a7336-1fb798db6f0mr46232975ad.66.1720410459057;
        Sun, 07 Jul 2024 20:47:39 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb48b1bb68sm50824035ad.283.2024.07.07.20.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 20:47:38 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2] dt-bindings: vendor-prefixes: Add prefix for ieisystem
Date: Mon,  8 Jul 2024 11:47:35 +0800
Message-Id: <20240708034735.99939-1-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a vendor prefix entry for ieisystem

Signed-off-by: George Liu <liuxiwei@ieisystem.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..0ffa8d06aea9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -609,6 +609,8 @@ patternProperties:
     description: IC Plus Corp.
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
+  "^ieit,.*":
+    description: IEIT SYSTEMS Co.，Ltd.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
   "^ilitek,.*":
-- 
2.34.1

