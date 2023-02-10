Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0C69182C
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 06:55:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCjdd2tyNz3cYd
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 16:55:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Q/IQZilN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Q/IQZilN;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCjdV6SYVz3cht
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 16:55:42 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id r18so3017237pgr.12
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Feb 2023 21:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBEDRihCzDtrVkBKLnVTDhVFILtVss8RIDHmoPN1r7w=;
        b=Q/IQZilN4zWkZJKqDLqhFfojSgNZKTcRW3gnI/NWshsNU1Ba6sL1V+ruKzrzCHz/iK
         E59JxMxWwMx+j+/2bCx52XS+T+lAjd4uqjAi3WYLZgQdM6ASVkxxQo1AoX3EnHfbLnpZ
         5RDJd/0kMJ0a12Nm3Sp4iiDz16nuxBu86KKHnIuPcxphQ7UvdRSr+NsYNdEShUnt+F+Y
         w4giOVtaBBBriYZxTgMwMMzFhsb6AgiPQ8X6iM1yyGZjzuRnlyMFIqHus6Sdsj30RDAD
         grTwl+3gSQr4uG1PNvTCKZz5d4pzQamyOClQ1m5uTfVsmctYND4/5iTkjAUr5PbU8JQN
         TdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBEDRihCzDtrVkBKLnVTDhVFILtVss8RIDHmoPN1r7w=;
        b=RNFr0Z/yIMZ47eqhQOdlHYGMxsliHvDeC8Ta//mchApdlSUoBonndQnpWcKCjlR7Gr
         NmVABIhDZmZgPs+MUvbE5ff7F2MCOR71FWezBfwR8DzNEo7C7QNktsdhSrm9KueDkHHz
         CGOQk6GyO+b6aXucQgo5Tn8kcsaF4T3VkOjRCn+38+8FRC9IFa6+KCn/dk+V0HLRvXQK
         W5aeyQq6xAsz5IB/yA71Z3fo9z9s/BeqmatNri1FkRuZIu/fc/ycbHiKKGOwfGLd3TeX
         tbIYf+tozth865U1B07FGm9gqUwmLLvY/DFo4w/XLMnFJ02tmadTGDs7BUTvwXtJdGjc
         VMBA==
X-Gm-Message-State: AO0yUKXoInamJS13GdLzWWZkbJiD4W4zAV8oOZtgwRM+FErSo2FeOPEX
	NNTWLszxkYFyPgFkLovfHJ0edg==
X-Google-Smtp-Source: AK7set9ChVdnnmJf43lU79NxYFsgPGiwAyo2EN9Zw+h9JLv+Iq+zjPAufgMAqtBJWXCrjPWCL96WFw==
X-Received: by 2002:a62:8407:0:b0:580:d71e:a2e5 with SMTP id k7-20020a628407000000b00580d71ea2e5mr12071630pfd.22.1676008540641;
        Thu, 09 Feb 2023 21:55:40 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id f15-20020aa782cf000000b005a84de344a6sm2500025pfn.14.2023.02.09.21.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 21:55:40 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: aspeed: document Ufispace NCPLite
Date: Fri, 10 Feb 2023 13:54:50 +0800
Message-Id: <20230210055451.72153-3-jordan.chang@ufispace.com>
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

Document Ufispace NCPLite board compatible.

Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 272626937ecd..0f180aad3a09 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -85,6 +85,7 @@ properties:
               - jabil,rbp-bmc
               - nuvia,dc-scm-bmc
               - quanta,s6q-bmc
+              - ufispace,ncplite-bmc
           - const: aspeed,ast2600
 
 additionalProperties: true
-- 
2.39.0

