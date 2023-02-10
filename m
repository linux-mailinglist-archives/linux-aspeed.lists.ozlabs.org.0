Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F669182B
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 06:55:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCjdT6JR6z3ch9
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 16:55:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=qX2ByVWP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::1042; helo=mail-pj1-x1042.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=qX2ByVWP;
	dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCjdP5L71z2xb4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 16:55:37 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id mi9so4202782pjb.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Feb 2023 21:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOWZYtFSMZdRgTZRtwN+AemiOXW5qdoRRDaQg26mJB4=;
        b=qX2ByVWPE4aBjlRMLrL54OIfFjczNDBVnStOH4o6pBDT7bKsF/KH2nqwolfXEffYfb
         ciaIYD4ToadaVE2zGYSU06S7T1PFzqNvgIv7Vn99W1IEhZCRr44FupgTy7VI8Pu8mbUW
         8CE9MdFGZGOfD2pgTD34FtQyUlu8H7gVh/PGuID/Invcq8qCyzeUZ3vScrtTO1Cq57TF
         UmkYHDi/RwzJLwIZe32q0N/vHJm+F57bQMDeTGfPa4dXJIPhcbzWFh9OL+I5k5SCzDxE
         e/R9cH5BcnTs0K9JmnB1VOYnz92Cq9JpaK6qYlXjSb1b424bIujlcu+pcqdm8Wc8cEui
         WTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOWZYtFSMZdRgTZRtwN+AemiOXW5qdoRRDaQg26mJB4=;
        b=WyU9q6VvQiwhsBvz9TIUU2lHnzrDiIbDTTCyLLHSPw08CBzhhrFXgRasV5l3xCHwup
         XtwrppqKzP42luGtzosHbYdeRxK43lD3+C33sMEC7H7pTicO8npR6vNPDNPxgOhWZaLX
         1BtKzeEP4qqsrul5K++kZjuELpdK+WT3/0w0PHRzIT2PjS+EYnPm4pkDpxS0PNdhb/Ge
         QKdEtaJ/bBhDdDK9X1sk6DsGUDyqPusS+dkA1FPul7PhF8VIYsnywfJx0uk5tmvqVLAx
         tyburwSpGNv4mitYgyDXeQMTWi0ZtrIad+iRjgmoPuHoJUG9TEG3+A1McfmVFXH2yX+m
         oOmA==
X-Gm-Message-State: AO0yUKV1ohjbKKoEqSQR3bNGGKyIywjq2eaYxO8R8SuKazbtLUeKeP5c
	Hbj9gEb3Pbg5XcxfiHEcwJrTIg==
X-Google-Smtp-Source: AK7set/ykxKlkDwF0/T3aR/bVrgtsB13Pq9PvzCND6CyzvOu6jyi70LyDh3XNdelfmqYZvmGoUVT1A==
X-Received: by 2002:a05:6a20:3d10:b0:c2:fb92:3029 with SMTP id y16-20020a056a203d1000b000c2fb923029mr11057445pzi.33.1676008535517;
        Thu, 09 Feb 2023 21:55:35 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id f15-20020aa782cf000000b005a84de344a6sm2500025pfn.14.2023.02.09.21.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 21:55:35 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add prefix for Ufi Space
Date: Fri, 10 Feb 2023 13:54:49 +0800
Message-Id: <20230210055451.72153-2-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210055451.72153-1-jordan.chang@ufispace.com>
References: <20230210055451.72153-1-jordan.chang@ufispace.com>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a vendor prefix for Ufi Space (https://www.ufispace.com).

Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..ab0dd1cb5ede 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1344,6 +1344,8 @@ patternProperties:
     description: Ubiquiti Networks
   "^udoo,.*":
     description: Udoo
+  "^ufispace,.*":
+    description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
   "^uniwest,.*":
-- 
2.39.0

