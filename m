Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEF8B4C30
	for <lists+linux-aspeed@lfdr.de>; Sun, 28 Apr 2024 16:32:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HorQVCLT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VS86m4Q9bz3cRy
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 00:32:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HorQVCLT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VS86W2ll2z3bjK
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2024 00:31:46 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5f7a42bf0adso2565487a12.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Apr 2024 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714314701; x=1714919501; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=59EuPpmQZ2ij22OGvTjuvfEIHIx/+kEAdk6lJgaolM0=;
        b=HorQVCLTidrKoMEhUWdPwQokPTqj7CgBvxFRSdHDEtwfuF/2/qMiqksWmfQk6FfwXC
         6bfsm0wzfvt0VWTllfxem2n6Z+NiWi6oKNSbgtNkr51EmI1O0tEYmWBgilMseDnGymsW
         Z4CPFtLvcYlYB7bTuvhqKwy2hqogJQ4RYv2O7FMrZFhLLEggirMlrS36VxSdM+kh2qI5
         S9p68ccWgCmjxNO0P1YlBpDGCEVVIbmXnvqrXQl++yikZh6y7pDmI3u4QuodN5lsT1+O
         echxg8om4Zb8KAy3RXmb49JBay6Ns4Fn9AAjX3XltOVv/ogLH8Hxy+7meuFFUMc3I+p7
         FfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714314701; x=1714919501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59EuPpmQZ2ij22OGvTjuvfEIHIx/+kEAdk6lJgaolM0=;
        b=ARj1ZVi2dKuA+LpA89V8rky8ANyP26WXU2hYdnbX98U9KuMcIiDNCFMe00uMbfXCOz
         5JDrIIPToN22J/JVwnQex+VfurWsm/qmx85h19xSt+DLjgMI7uV5aO9uV0tjYct6w0CA
         DEJRuP2ZOUK9sOmqRH7YgPa4I6mb5pED7k1ppCLp1U8RTLZDknwAjrzE1n8bxYchmQWN
         LRe8LDgmO0aWjfhKVDZFzcdYCg9dgcEOO7iLRe+3BGqlWJUqBruubpew3LXnkaGrJuA2
         P6NDa/KpATmp/4CJMStHCQuzPHZQfGRBhbUqccUqBmXL5aOO6uH5Cyg7QzdgN7U10efA
         vBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwIkP3OWuGeAPtewvd0biAFJSRRiRPV3cyFtRKhbCnC0KFdNCxdXw3nSRUh1qAx16J2mSQJgLXuMMCm04/0hdK5KLSnUVTitBxPOoNEQ==
X-Gm-Message-State: AOJu0Yy5qXnjn3+VZ3GzdArsyMUU0rHuqmEdAUBFkeG3jTJvy4stYSF6
	b2xPhlgp8mCPA0Tsw7YKOuEL6ksVoEipf9ZX2NdQw/+NZJzItL63
X-Google-Smtp-Source: AGHT+IF8P9xi3Y/OKCRwo4517T0rc2kzeu7K9T9yHbVaapsQ6rwWWUZLFHeMRWJrF/Apg+3rTcbhgA==
X-Received: by 2002:a05:6a20:5528:b0:1aa:a421:4239 with SMTP id ko40-20020a056a20552800b001aaa4214239mr6779394pzb.15.1714314700978;
        Sun, 28 Apr 2024 07:31:40 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id h6-20020a636c06000000b00612dc2ec375sm1034834pgc.16.2024.04.28.07.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 07:31:40 -0700 (PDT)
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
Subject: [PATCH v8 0/1] drivers: watchdog: revise watchdog bootstatus
Date: Sun, 28 Apr 2024 22:29:35 +0800
Message-Id: <20240428142937.785925-1-peteryin.openbmc@gmail.com>
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

v7 -> v8
   - Simplify the code.

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

