Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A312888F4AC
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 02:33:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TT0MIXMR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4mJZ304Wz3dhR
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 12:33:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TT0MIXMR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4mJT4DsPz3c12
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 12:33:13 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso298459a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711589588; x=1712194388; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwzVZ+IWpczySSp2ln+6XuuWUjbpq64nflGUKemUacE=;
        b=TT0MIXMR4eiESYkiTnSdNhx+yMl8UOUHFTOfhJhtxcmCWpknHnd9EetRVpvVjBiA0M
         DiscJoazhI9i0E3KKPs4hmPSQ/lHtxY1fOPbRNl/sLvkiFICwwb7h62YXZc8AQMjHHV4
         hrarubsgBRa39C1LbPW3zFt0OBJIq7Yzn8OJOFQUs8qlXbj4vEJOcjSha2B4OR7OWF6+
         6tsSCcFH/eCqaRJMTri97J9/Cp5KNoMrqKhuF8dYlDu/Nl4L7MUIIKxjoMJ67tZGh7IS
         4mE1eL2P2YxZSkVwCKlb/g90XDfcv4CAYo+8XSLwG934LawEJgeayVm6hWFi029/zfa+
         TiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711589588; x=1712194388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwzVZ+IWpczySSp2ln+6XuuWUjbpq64nflGUKemUacE=;
        b=CTDy3KoKJkqpUbvpyD8d76CZ8KBDYSkk96/fUM7hZxdXm/6z1EDHxDmnZTIX+pQZOA
         t2q1vGu5cLkBdYQDqHs8ByyzF//4OhYsoZs7XU0G4Il2HO2RhgNbsKjOeyI7xWjvEhTk
         XKxH8ik/roKooSJ0frvs6eOLjV7AyOimZqtttlrHQPCXmp1z9g0zNEZSlwd5w9qRDsrh
         R+6HRMOKDS8alzzD0bqmJqXlfxYDTu8qbhx/r3XfisUMG8uS+ENvAr9cD9dvWSXLZuW1
         l02n0ZIMjyyQ5xbVXyv3O137sbdpONapdnvuaydiyacRmnfpi3Lkj8YSxTx7KvbmaWvi
         hhfg==
X-Forwarded-Encrypted: i=1; AJvYcCUhLmCDqpztiKWOjwGPy3Nmmq7bZ9IKJ4npnnmhGN+4jCQLjZSaCk2qyZ7JOiUwxrYJh2ltM+z6AYmPK3Q8sH7E5h/PcvrT/WR1CQca4Q==
X-Gm-Message-State: AOJu0YzBWqNq4YwtBdlUaa1aL33AP+pPpd+x2JMTuRqLzovGI/xOt5Vz
	CDzLe6IRa0YT1KZWnwlP0a1kXoy8j4lKcwNrE/rBShEEw7KiXftF
X-Google-Smtp-Source: AGHT+IFuuOxiVIqTtkjpl1E/e0b+0s1F3aV7PFkrdsx5dIaIXuKhPY9sIiffaQCR380fHvq1VgjLeQ==
X-Received: by 2002:a05:6a21:398b:b0:1a3:4e31:ab8f with SMTP id ad11-20020a056a21398b00b001a34e31ab8fmr2153722pzc.17.1711589588358;
        Wed, 27 Mar 2024 18:33:08 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e355-7eb0-b4d0-66d2-2269-ef6c.emome-ip6.hinet.net. [2001:b400:e355:7eb0:b4d0:66d2:2269:ef6c])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b001e0e85a21f5sm201338plg.32.2024.03.27.18.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 18:33:08 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
Date: Thu, 28 Mar 2024 09:32:58 +0800
Message-Id: <20240328013303.3609385-1-peteryin.openbmc@gmail.com>
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

Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2500/ast2600

Regarding the AST2600 specification, the WDTn Timeout Status Register
(WDT10) has bit 1 reserved. Bit 1 of the status register indicates
on ast2500 if the boot was from the second boot source.
It does not indicate that the most recent reset was triggered by
the watchdog. The code should just be changed to set WDIOF_CARDRESET
if bit 0 of the status register is set.

Include SCU register to veriy WDIOF_EXTERN1 in ast2600 SCU74 or
ast2500 SCU3C when bit1 is set.

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

Peter Yin (4):
  ARM: dts: aspeed: Add the AST2500 WDT with SCU register
  ARM: dts: aspeed: Add the AST2600 WDT with SCU register
  dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
  drivers: watchdog: ast2500 and ast2600 support bootstatus

 .../bindings/watchdog/aspeed-wdt.txt          |  4 +++
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi       |  3 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  4 +++
 drivers/watchdog/aspeed_wdt.c                 | 34 ++++++++++++++++---
 4 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.25.1

