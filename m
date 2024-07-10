Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD692C86A
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2024 04:23:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T1budagm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJhV36pqpz3cF1
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2024 12:23:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T1budagm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJhTw1zDlz3c3W
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2024 12:22:58 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-78006198aeeso210007a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Jul 2024 19:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720578173; x=1721182973; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+ZDbVG/Y99+yBdm+TuUFC2L8LW4XjvaG/3/t0EYbiw=;
        b=T1budagmwPiJEsasjPH4q66BEZbrWvWh+DCRaElAsPs6eba5KqKYd2u3iSrQk9rRVd
         D74oV15Yu9CtfEVk1uDt8xcyUF6gZyv9cLi/Z7/r6B//5gbQuuoy0KGT4MjTQMfHk8+z
         5yzBW3bCsjkWTIreb/3wx3ynVYAKQJ10U7MVGn1bVx4I9+oTal9tC56UZ1kibs5BJiQn
         /svUgKE6s3b9CmXpTbtq7TkLkzWVIt9EykaVmTf+h5XuuOdXIXctGCqBNtdAhuwwyqJ5
         WEbJ8DwPiPukmkkjDItzmgXDanrNum/85BZIMsoIGWDedHfplRHOm1/KLHeueByBYLUs
         r76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720578173; x=1721182973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+ZDbVG/Y99+yBdm+TuUFC2L8LW4XjvaG/3/t0EYbiw=;
        b=X9PhcSeke7S/f/knVq0iqCbeVztYnJlWMNhETtZFEUXT1RS0vkL2i03BtD6MGaUJc6
         H0c3cmW+WVPMUQPS4rHGpul3WxD2oCwzgyn2nvrsS1F85APyn8kouoUJ4ZNI1VMXh94r
         qzRgjmIwk4cl7cQZs6T76e9dN/aOIs62fscK7egKrJkoNQz9wgvnokUTEX7eJJgsAHct
         iNMVmoexCG/7UYo30LlS6jNHtPTHrmDviQLAoS4rATniBVWFj2KeEDw7GqaJmB2Jm15C
         FmTc0rpIgOKEQ/LyWwlJmRNxyGmkxSpFbX2WPZTughKE2ihAL4aTS6x1xxNMILqLzU/d
         oIPQ==
X-Gm-Message-State: AOJu0Yw/HuT4zjZQkDXPbNdr1XLZs8Zggnj8Zxzmhb68lT5tu3vxoSRD
	kCN5089Yz2WA5iqGTaEzc6Zx2KY+OkO+0kAmNkstuvnTMFJGsXsGTZTF1Yfg
X-Google-Smtp-Source: AGHT+IHD9dgbyjWPV3/KHG/FDuQ2ePIegEDkKiEL+FqpDRfaDvYtCr6tfTfiokeMU1yy66lxZcBokw==
X-Received: by 2002:a05:6a20:8423:b0:1c2:a29b:efb4 with SMTP id adf61e73a8af0-1c2a29bf269mr3912393637.24.1720578172878;
        Tue, 09 Jul 2024 19:22:52 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439678e9sm2539162b3a.137.2024.07.09.19.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 19:22:52 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4] dt-bindings: vendor-prefixes: Add prefix for ieisystem
Date: Wed, 10 Jul 2024 10:22:49 +0800
Message-Id: <20240710022249.72234-1-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, George Liu <liuxiwei1013@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a vendor prefix entry for ieisystem

Link: https://en.ieisystem.com/

Signed-off-by: George Liu <liuxiwei1013@gmail.com>
---
v2 -> v3
 - match Signed-off-by email
v3 -> v4
 - add link
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..a559ac5789ae 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -609,6 +609,8 @@ patternProperties:
     description: IC Plus Corp.
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
+  "^ieisystem,.*":
+    description: IEIT SYSTEMS Co.,Ltd.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
   "^ilitek,.*":
-- 
2.34.1

