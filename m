Return-Path: <linux-aspeed+bounces-1472-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA70ADB156
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Jun 2025 15:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLVnh30Jjz30RN;
	Mon, 16 Jun 2025 23:14:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750079640;
	cv=none; b=ohJr75Nyz0OiKAzEyhT1JYXx5bsWaZMG7j+fkbzWuRMecO4BKWgYBFGkZ/oX+1UcbfGyjYPVeF97HrhiPWiNVoZ0/5JnYy3DfO+sVhe29/H3HrnwV2tYdU+Rf8WoTLXrHvFKOR2h4tlHgL1OCorCpyUFq+PG8NlTvBAwgH8tnWJGprVZNnqInkYMAmb5hVh4IAlcGuxWUp6EoQVnA2vHMC8hb7dIqYhqTOYDgYXUUNOms/bEfd9a22ZyMPkmxKNAVt1f5hGpJVMQ9Zvre3HIoeX5jORNasWjB9Ek0I3it9BYw7RxDo1kR1z1sNC3nPifOytk3RIWUxm0e4NF1l27Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750079640; c=relaxed/relaxed;
	bh=uPBAGZy6R1PjnTGdxsiEYdDy+NUG1t2EFZNMiKI6egA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b1+pSAuZ1XTGCy2DJpMpTGMy+K8o44sMRBhXHYFKFuadjvLKT0/4mnhCALgsLfdqsgh13PKQBqDOEPp+5FsXC0sdMGElU/WbGYP58sSVBg3OqaW8Fl9UH8al90itcAUcaoc27XkGZosYJqmroycNbbFVCfehN7vzNZIXYktawrqumz50uYPEYtTjLmwodLEiJ5d5fVNUjMaL2d9V8n/SOJ28RyK+fypaNa3vLpDjyscSWlLna7XgYj6QMzEmlMwWfuqPbtp3jaoMd3ucDixaHMUX8DLtblsptSmuPLkIiBOPCyhSjRecYapWgjw1/KuzrzLMcZ+lco3bFy2zGuMBFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I6KwpY03; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I6KwpY03;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLVng2nXWz30T8
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Jun 2025 23:13:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079637;
	bh=uPBAGZy6R1PjnTGdxsiEYdDy+NUG1t2EFZNMiKI6egA=;
	h=From:Subject:Date:To:Cc;
	b=I6KwpY03w88PFgiWEf2PmautpWVe9dZGZTdWKrhOf0aHsSlZTZAcWf4qW3uPN/25n
	 pPIcnBuY49xhsixkLINKjlxQRU9emTcGcTKB+ORxw+4v7yICvZgcqwmXUeff9CrJ/o
	 HBC14x4EOgZKGbqKbDUcAEcL2Ia5l9A+bfaUlPeEjQPoEf7bH0a4ooFEU1UzH67QBF
	 1zAyoTG5MwgyQaXtziDa6DJcJmFigh+iatbuzLwU4fZjE6wIM31gdtcMS8oqa9ZCTG
	 sDGz57TESvcZBSMAGjGi6L6V8JVTCFO+kJKamaFVwDQpFU/XfbcP9zqCttLzLJWzB5
	 CUNdX8WNfOYLQ==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 596AA685DD;
	Mon, 16 Jun 2025 21:13:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 00/10] soc: aspeed: lpc-snoop: Miscellaneous fixes
Date: Mon, 16 Jun 2025 22:43:37 +0930
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEYUGgC/3WNyw6CMBREf4V07SV9ACGu/A/Domkv0kTb2luIh
 vDvVjRx5fLMZOasjDA5JHasVpZwceSCLyAPFTOT9hcEZwszyWXLGy5AU0S0cI0GyIcQYXQPJMD
 Wyr5XViutWBnHhHtRtufhwwnvc/nPv3BylEN67vJFvNOvR/z1LAI4dM3YSolK2248mWDRBE85z
 SbXJtxqPbNh27YXhBDrSNwAAAA=
X-Change-ID: 20250401-aspeed-lpc-snoop-fixes-e5d2883da3a3
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Henry's bug[1] and fix[2] prompted some further inspection by
Jean.

This series provides fixes for the remaining issues Jean identified, as
well as reworking the channel paths to reduce cleanup required in error
paths. It is based on v6.16-rc1.

Lightly tested under qemu and on an AST2600 EVB. Further testing on
platforms designed around the snoop device appreciated.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=219934
[2]: https://lore.kernel.org/all/20250401074647.21300-1-bsdhenrymartin@gmail.com/

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes in v2:
- Address comments on v1 from Jean
- Implement channel indexing using enums to avoid unnecessary tests
- Switch to devm_clk_get_enabled()
- Use dev_err_probe() where possible
- Link to v1: https://patch.msgid.link/20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au

---
Andrew Jeffery (10):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
      soc: aspeed: lpc-snoop: Ensure model_data is valid
      soc: aspeed: lpc-snoop: Constrain parameters in channel paths
      soc: aspeed: lpc-snoop: Rename 'channel' to 'index' in channel paths
      soc: aspeed: lpc-snoop: Rearrange channel paths
      soc: aspeed: lpc-snoop: Switch to devm_clk_get_enabled()
      soc: aspeed: lpc-snoop: Use dev_err_probe() where possible
      soc: aspeed: lpc-snoop: Consolidate channel initialisation
      soc: aspeed: lpc-snoop: Lift channel config to const structs

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 224 +++++++++++++++++-----------------
 1 file changed, 110 insertions(+), 114 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250401-aspeed-lpc-snoop-fixes-e5d2883da3a3

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


