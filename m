Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024E5403EE
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 18:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHbgD0cvsz3bmQ
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jun 2022 02:39:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gj0//NcX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gj0//NcX;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHbg15B39z3bkk
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Jun 2022 02:39:41 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id c196so16008765pfb.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Jun 2022 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aawj7hG1Xbc+Qda8TB7Lg5hLA/qmPkKw+fCuOCx3eEw=;
        b=gj0//NcXWdRESh0slbXEmK4UiYABgxbNpk9xMhOaO6vBUgQcZNsX3t6RJtmh3zCpC8
         6FxRO9P5loqq+uRE60xUQMNonjzinITqCrsDh5u1pTwvtjTu38ie4+gCe30Daf6DAFqh
         C299g5Cp9pCnPkJ/aSNCa83Wbo7C5L4oHparszEnh7uGoA2ZRpkUDSvaIizVHuX6h2tJ
         NoK/95kryoWrZ+p43VHqmTJ55zdsq6HmlUqmOx8h8ZIDnqdAD6/hezEbOW+Xp89H0mYA
         GibckzYUxy2ilra+pVO6KanBAi4dglRoKVVoE9WPXDB455lK32vKEw4/wgf+m6UmNoZe
         1Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aawj7hG1Xbc+Qda8TB7Lg5hLA/qmPkKw+fCuOCx3eEw=;
        b=OECO6CFpe/MPOs8l6ArtAOTrMJSfYnE2ycxxUH3d4kw3aiZAzJKAJw5zml6Ae4yMHY
         svk8tQByrKONajh/iWzW5McPPgiYMG8H0yefgmCEM8tw5qMsixVgwOYinWUocWR/0yRp
         0wS5IHThI76CGBAyjhpKYGASfC6IBKI92ZkWw0aZlZ4AG4e0Spgs3u2OUr/muk4q1E6A
         gfuNYUtka9zOcUqqmSRRdgiOrDpJfUuhaPbpfda/q4d8SqGXgNtFyNinrXrl8c1KinNk
         b/jQYguFHzJr8PolLtfSZDxtNXnDzflHIFVS/bvMO3eHBwNUfwPDF67s8qEPgw7ZZaTQ
         0aWg==
X-Gm-Message-State: AOAM533ipkqepw2Fkr8bFegSPC12r7UWKjzYJHIo+i88QH5yS9z48ETh
	pbGtHSBl66ZOW/7GyIP/E2M=
X-Google-Smtp-Source: ABdhPJw1wLF5PQnn7vw9tzWD7yWUylInWPqMGKa9/YsNsEWJz7DaizG+XWonJpgcLRvbujhgg2s/VQ==
X-Received: by 2002:a65:404c:0:b0:3c6:4018:ffbf with SMTP id h12-20020a65404c000000b003c64018ffbfmr26572041pgp.408.1654619979325;
        Tue, 07 Jun 2022 09:39:39 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id d15-20020aa797af000000b0051bbc198f3fsm12560272pfq.13.2022.06.07.09.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:39:39 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v3 2/2] dt-bindings: aspeed-i2c: add properties for setting i2c clock duty cycle
Date: Wed,  8 Jun 2022 00:37:03 +0800
Message-Id: <20220607163703.26355-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607163703.26355-1-potin.lai.pt@gmail.com>
References: <20220607163703.26355-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Introduce a new property for setting a minimum duty cycle for clock high.

* i2c-clk-duty-cycle-min: a minimum percentage of clock high

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..af4c49111cc0 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -49,6 +49,14 @@ properties:
     description:
       states that there is another master active on this bus
 
+  i2c-clk-duty-cycle-min:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 100
+    default: 50
+    description:
+      a minimum percentage of clock high
+
 required:
   - reg
   - compatible
-- 
2.17.1

