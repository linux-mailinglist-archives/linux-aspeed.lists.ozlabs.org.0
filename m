Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE55E54F3
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 23:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXrfM2n1mz3c1M
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Sep 2022 07:10:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eTmgdq+0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eTmgdq+0;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXrfB1ptdz308w
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Sep 2022 07:10:09 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id o2so11301745lfc.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 14:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4M75LCnR7HEj9mQ8XBusERBnMSMu8fybz1DwQ5l1ydQ=;
        b=eTmgdq+0jDw0IWy1m7/i0AfInQwqI8gB0H6o7pPnGf/9thckvHt9AJGM5oOF9+ooLH
         ymGByAeUfbx/gFUaD9mvGcIASKGLPI/Mi5XLV91zm9FpqOuzxORpPFb6HD+PqBtJ0CML
         4ZuhYmA6xL8IZQKn/KI+a5Ab2nm5I78rwrBQYhaQ4MnVs10nA/aAYGZx0d2YUxhkbWvV
         kqvwndgFbiVT6BQIil4Wc2G7vQBMxEVff0hiwypMGxJBM42OZyBUUwwxqhT70fCnwylI
         173RuB2WwV165RRSKufhRR0IlvJRhMhA1f50Wzh9xnHWbvz0RQiOUufFJUmK6n8pLIQQ
         2FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4M75LCnR7HEj9mQ8XBusERBnMSMu8fybz1DwQ5l1ydQ=;
        b=QOZ+rvfvdBnrJSFepMFyHa9wlbQ7zRitRRo6qjDA2ky7mo5NF8tmKR0SvAfsvq9qbP
         ocHQiH6ryEjG/t7R4j3LxKFhofFFO7tt6kSctxQ0UGeL8htbpmAbRxdsBTSMl8QiLN5g
         CTMtMDFz3ylSQckl9wLSpxHg5I56uBeEWCJ30u7q/todjQsWp6cpFqEkiVdKRdPwooW/
         T/SgFgLGXjle1TtrrLhV2Yi/xzkAzK768VOU2BdmOxrZZqf/S6Z58ojZ5Hu8KqmaBCVe
         qTu5s6NNzVlyt0yPJrTudJj2OIybQlMVmhdVZlgVidXwAVAQgZ/1B66SKnlQ2qvyvBKd
         Vdvw==
X-Gm-Message-State: ACrzQf1puflzQYt4IroLLBlCDkda3MfyMV626FiqRAcma+LvOYsYW8pA
	OpghRyMMW1SjLi0pfC6cwcs=
X-Google-Smtp-Source: AMsMyM7BZS78FaEFgZwq10AX/72c6ZZ+GlyiViqqj3ES8IRwPmODSH7j3C4TQWbLzmZqbP8lk6RdmA==
X-Received: by 2002:a05:6512:613:b0:497:a8a6:464e with SMTP id b19-20020a056512061300b00497a8a6464emr6689lfe.604.1663794606483;
        Wed, 21 Sep 2022 14:10:06 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-46-242-10-176.ip.moscow.rt.ru. [46.242.10.176])
        by smtp.gmail.com with ESMTPSA id z18-20020a19f712000000b0049adbc24b99sm599260lfe.24.2022.09.21.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:10:06 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Date: Thu, 22 Sep 2022 00:09:46 +0300
Message-Id: <20220921210950.10568-2-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921210950.10568-1-aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Konstantin Aladyshev <aladyshev22@gmail.com>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Document AMD DaytonaX board compatible.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..cb9bc65df82a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -29,6 +29,7 @@ properties:
       - description: AST2500 based boards
         items:
           - enum:
+              - amd,daytonax-bmc
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
-- 
2.25.1

