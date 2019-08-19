Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DBF91C58
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 07:18:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BhzD0QdnzDqck
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 15:18:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtevONa4"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BhyW2jkbzDrDQ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2019 15:17:54 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id f17so459047pfn.6
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Aug 2019 22:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POHZpkPS//I34g8k/kk1/SY7LDbqKnT8nCOMJuIUBXw=;
 b=WtevONa4TaRG1SGxKo/EbUBePcgV7qdbDsZVbPt+gX0TR7SyAOHFQCmO1MUpuucFa6
 TEJ5/9ZywOrayfT8oTxrLOu5X/U4s2fKDA7gFzsQbzXzCyeiDYFOGMk5EAtIy7Tn0lai
 5Ah4eHo5QIJlnY3qsAeRMtcfubHa/DEhdAClxLSe9wPQdxTeJRGeZ5SnYAuVTE8eTuBh
 LCdwmMygIKcdcP+qL2BIfmHYU6O/Om3aS9tdOfKT6FCeVkPdEQ1RhM1DEszu7Syrk9/2
 M281Ewo3LADwRtWHC+BXJDJg/vE4RupoTKtfDFdYdUkz5pLMpApYO5FFTZ9vQXvJ+UJB
 FLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=POHZpkPS//I34g8k/kk1/SY7LDbqKnT8nCOMJuIUBXw=;
 b=DaXQeqDBlcAkikPPB4wOydUzOX8D6ehxqgq3cpuHzsym4Ea++6LF5yyI8MYgpCwBI2
 9ZllOZh1XI7pJw3ArpMIzFzjknPKngN3I3Pi9Hp429HFEMM+Yr2bUyunW0Le0bQ+cSUd
 njQZUv3/6vI+SYkyWeEKdgoy1UIgXtt7ZcwXXm1NkGCl9FQ9iYesMtLP2AR7CBHoysSf
 kM7N45N+zM0X6iCVUMr/wadkqStUtK95vjuXXGh+5yTDDqaekP15BVHK9o2Mql3AhTG5
 YtGATo0ZgC0uEKG/1B7G7YiIklVLnbSII0GYO5yqZV4Ui+p4xk83BlEgIUlhIKlOvgkw
 Pz1Q==
X-Gm-Message-State: APjAAAX2wxbK2HSefM/UDdRyZqGYmrEDP9cWa0AOn0niuykWghartxYS
 KwRY4tNQ8aJ7PnS5dtNmHUY=
X-Google-Smtp-Source: APXvYqx6I6EneoR0da6GR47cQfcPZWPNtpv7IgXI6pONXzKvyKww67S/CudJMaSqD+o3Gg0Lox1VzQ==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr19430107pjr.132.1566191872230; 
 Sun, 18 Aug 2019 22:17:52 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id o3sm19010087pje.1.2019.08.18.22.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 22:17:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add ast2600 compatible
Date: Mon, 19 Aug 2019 14:47:37 +0930
Message-Id: <20190819051738.17370-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190819051738.17370-1-joel@jms.id.au>
References: <20190819051738.17370-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This adds a compatible for the ast2600, a new ASPEED SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
v2:
 - Add Andrew's r-b
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5077a1f5cb3..d78d4a8fb868 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -4,6 +4,7 @@ Required properties:
  - compatible: must be one of:
 	- "aspeed,ast2400-wdt"
 	- "aspeed,ast2500-wdt"
+	- "aspeed,ast2600-wdt"
 
  - reg: physical base address of the controller and length of memory mapped
    region
-- 
2.23.0.rc1

