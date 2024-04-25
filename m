Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 430448B1D70
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 11:07:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YZW9EjFN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ9413l4Gz3dJd
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 19:07:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YZW9EjFN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ93r5BvJz3dJ5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Apr 2024 19:07:35 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so1314817a12.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Apr 2024 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714036053; x=1714640853; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aF09Zg4sIkL9gC6ySi6dYbvMyiOsYCbmHeTeGavPjPQ=;
        b=YZW9EjFNF3texV0MTsgc/y3Ke4eFXYTCjI4wI0DS1thNnKWVnpgRVj5c+AkuUUZwm7
         tfFsb6MomzjZHwwRAjqVLRs0qSFIeqz2bg6uxm0G/WCjzV1vDzm0olRfY/K3xPTdXdu+
         rpU3stns/nxueVL0cKETatQ9XY4ymA9BcniFGlnK8jKss1xJg0hJ9b2Fj60jtkd1C4Ow
         1whPPe7R7XZ9FbEjCTL9WrnLmCvBVYSLPATX5i6CSBDPfWINjZVsNDj5uScGhAwHAdaA
         k9t3WuVqao/kY2w/FNuEYnRUllmG/hLNiMGe2BuKATA8ucDVvOcXf88XfaZc3WX+cUP/
         Q43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714036053; x=1714640853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aF09Zg4sIkL9gC6ySi6dYbvMyiOsYCbmHeTeGavPjPQ=;
        b=wfi7cFKbYWh0l0K5vZgPMTBjxLjbwCv/GsagRosuG6qzxQB3xlidddRuFZxJaiu1p2
         z9mDyP19gz9VSYK+rIGPQ+dBdGe+XIf6dg6+UOCUTY4rA9fE2Z4SvBQu6VIP4ONF3dN2
         eqjykp/jUjmN7T8xquyDHoTmW9o8VTNsm6K6YR/E6cUF6AG9Z7Q3QLfA2I8kTXUE+BAO
         oyAra8TbriitkVWEaV7VfSiG7b+qp8HWUlz+q+vn5iwemreCnAUpjjyxbKtLVxOn+6+F
         IPT0jdsMH1NHxZHzXDQxevLhyh6XvEG0mgl5UNnEe8egfVkDJN5wjOqPhUm/uSQSgM8p
         Jzpw==
X-Forwarded-Encrypted: i=1; AJvYcCWzEAqhMCs6j9fTF8JqJha9PEP+5LRqwQg5f9rjIQQt75xkE72haROm5rP3XrsUFf5lt91cCL0/cGueCsZBOq/iwoUJv4Q4wmJMi4MVkA==
X-Gm-Message-State: AOJu0YyBjiEmS7pqDxdyo9HDdiZJOMAN5h+VVjg9dD6ZsnzfCpzA39nt
	p71c8KIU1bctAYpTmD0jq/4RAlkbWzRJQBr+mjOEh6PBMAUBBxpq
X-Google-Smtp-Source: AGHT+IFD21qLbGfQ21jitVv21MhnQqqwNte/oiTmCZXGuAW6E9cGj+omlxd/uQgm3osJKLLf/+qgeQ==
X-Received: by 2002:a17:90b:4d8d:b0:2af:c3ea:8122 with SMTP id oj13-20020a17090b4d8d00b002afc3ea8122mr2283601pjb.7.1714036052036;
        Thu, 25 Apr 2024 02:07:32 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e339-24b8-1743-5d70-cc45-1c02.emome-ip6.hinet.net. [2001:b400:e339:24b8:1743:5d70:cc45:1c02])
        by smtp.gmail.com with ESMTPSA id g21-20020a17090a7d1500b002a574ab7f5esm12489938pjl.53.2024.04.25.02.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 02:07:31 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/1] drivers: watchdog: revise watchdog bootstatus
Date: Thu, 25 Apr 2024 17:07:25 +0800
Message-Id: <20240425090727.3787160-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Regarding the AST2600 specification, the WDTn Timeout Status Register
(WDT10) has bit 1 reserved. Bit 1 of the status register indicates
on ast2500 if the boot was from the second boot source.
It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET
if bit 0 of the status register is set. However, this bit can be clear when
watchdog register 0x0c bit1(Reset System after timeout) is enabled.
Thereforce include SCU register to veriy WDIOF_EXTERN1 and WDIOF_CARDRESET
in ast2600 SCU74 or ast2400/ast2500 SCU3C.

Change Log:

v6 -> v7
   - To use syscon_regmap_lookup_by_compatibleys to get scu base
   - Power on reset is set when triggered by AC or SRSRST.
     Thereforce, we clear flag to ensure next boot cause is a real watchdog case.
     We use the external reset flag to determine
     if it is an external reset or card reset.

v5 -> v6
  - Fixed missing WDT_TIMEOUT_STATUS_EVENT.

v4 -> v5
  - Revert indentation.

v3 -> v4
  - Add error handling for syscon_regmap_lookup_by_phandle and
  regmap_read.

v2 -> v3
  - Fixed WDIOF_CARDRESET status bit check and added support
  for WDIOF_EXTERN1 on ast2500 and ast2600.

v1 -> v2
  - Add comment and support WDIOF_CARDRESET in ast2600

v1
  - Patch 0001 - Add WDIOF_EXTERN1 bootstatus
---

 drivers/watchdog/aspeed_wdt.c | 109 ++++++++++++++++++++++++++++++++--
 1 file changed, 103 insertions(+), 6 deletions(-)

-- 
2.25.1

