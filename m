Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A637C90561
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2019 18:04:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697Rt0WTpzDrVB
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2019 02:04:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JdM3jUtP"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697RS0cMbzDrfx
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Aug 2019 02:04:03 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i30so3330926pfk.9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2019 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r15xV+pSvUz93fe9Op05lhHjyimxUmk5oIduSMlRE+A=;
 b=JdM3jUtPBbQDkLzajaWD6jVE6fQj4gee8v8Eq83IBHgZcKjyPv/AZVq0VfWEMLpYUQ
 ZU6Owvo1J9S2pYWi4Hj7r0IRGchjhlkbrAcRycGcOqE2tSCO2VJDafQFkENFH3S+hr4R
 NaP2/zKhUKJvM0EeoFAuqjvaI7HIkkF261RUkshtsqjDssYHnChk2sytsyKbouE9BDBO
 /IquPJrMBxpMKbqkED5JgbyKa/wIpC3upkER+sd60LpJM16bVxUQx/gvg6t7t5jPTtcE
 NGvPmyicV1wOycLhIfo8UiOvZ2sWmluaFGSD3IVmgPW08p2RJrAOpSsmvKEcFJuDxrHC
 Py5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r15xV+pSvUz93fe9Op05lhHjyimxUmk5oIduSMlRE+A=;
 b=KoUJt6ndHmhvV7IkZSCtK7XbAqYzckreImJZn0CofQY64HsM1Ozq/jvL+XxSIIYZzd
 +39IYPeNciA5JYkvJ1jDxSiW08ugkcHez3odSRlplCsOIR7WdJfvgBy4RS1xXYb3TnaQ
 XRu2Wl9WzCEHh+PWOu2W2sxTUnOEZE1OPQfDbHmyWtqSiA/etXJ+SwCknlElDiQVx7fb
 aQ54+p2PzPQQKZyALdeG4b1lzDOxf0SRgILwc4EWYnEZ/dcP3/Xi73dfi3Bix2zJtHps
 XeH6gocHMH0NtgbYmT90m6QalpNXkrFjpjy8QO5D+EVU9nB1VZb5wcPJULyNI/BCPrxq
 Drpw==
X-Gm-Message-State: APjAAAXPzjHzrI9ORCzPQH4R05MVbdvR810oqMjDAV5SzYljMge7m5Gs
 eebjTr31E30chtADN4Lvjrg=
X-Google-Smtp-Source: APXvYqw434z92KZltolLhjc/SLek9lgPRJMm0aZV+vDRBoG/RmT4CDXtcqHryvIT64ugBYXHYnqTuQ==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr8608739pgv.323.1565971441742; 
 Fri, 16 Aug 2019 09:04:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id m20sm7578607pff.79.2019.08.16.09.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 09:04:01 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: watchdog: Add ast2600 compatible
Date: Sat, 17 Aug 2019 01:33:46 +0930
Message-Id: <20190816160347.23393-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190816160347.23393-1-joel@jms.id.au>
References: <20190816160347.23393-1-joel@jms.id.au>
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

