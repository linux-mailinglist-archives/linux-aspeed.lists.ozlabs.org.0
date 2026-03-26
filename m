Return-Path: <linux-aspeed+bounces-3772-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDl/HRGgxGki1gQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3772-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Mar 2026 03:55:13 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B05232E879
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Mar 2026 03:55:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fh7g06p7dz2xcB;
	Thu, 26 Mar 2026 13:55:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774493708;
	cv=none; b=PM2EBm4OrEjMDpr744SWYwoFrQI08woJYecozWtbRH+ZrTv04ulUyngutOFqWbDhDZspV/LdvjnZPEYnTYbwLQHxHDCmDAKSOvr/yPe1G+VOxNtKleTXoIBiSY21CbH/sHQ9qfnE7XTBxn/Gc5ZfrQAQrv98x0vz6iIAB+v8RHVd/x8GNy5ASvIDBU9V9fCpPO/RU8T370yLFsZgST/AkN1uA3nnK/vIrdzcABSuo4igUTaOMwFYxqT2oB4MCqkIiFMhlLD7/2f24xYhumqy+OGRvAC/wEg4GshosBq8gJqVlhbh8GSKgC6hGIzvXfRcy4er2rdi9Qk+EW/OizgxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774493708; c=relaxed/relaxed;
	bh=l4mtEumOCiMQzVWWzIR1DoohIyGt0P5H3qYqzvyRbOU=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=cNCTtdeS+vIgxCUOrLRaFfd5LGAC/R86HaD//1KfQAl5BT26tdq6x2eXVS1D6Ycd6ylg7+oiXnZx+iA50rWJlk3a2ysZB9Z5qYy0MNeam42zYyWzhmkbOQWKIrBnBerQQtn3pXiP0Akf5ZC2n6lt2A9OcVYyGIvSirBlcAKLywh17XqFEqz3PvZO7QJadUs1/Jw8PSvk8mDPwJ6nXBRZCcSRqul2ORuVlOgz9n7wuT3dxR8q0bBq7bWgAMBcHY4AeZeGUUTP41Tqrw6pqTK/emXcFJOA8KIdW7ORriCZcKdlMbfybOEe940AOvZuGCiTXbJUOypCiS67y+rprXUkxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NccYpQ4C; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NccYpQ4C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fh7fz316nz2xS5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Mar 2026 13:55:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774493705;
	bh=l4mtEumOCiMQzVWWzIR1DoohIyGt0P5H3qYqzvyRbOU=;
	h=Subject:From:To:Cc:Date;
	b=NccYpQ4Coz6Uhm2j3vFrrAtwmbchovowc2eYGZJE7GxosHgOgayix3f+s4UxSf0eZ
	 HMvgr1d+0SpUF9lZDH8zJ/j+02Nr4GNMm+RcLJkyOkXeVB0h4tUmgqpVj1aJ/VnEBY
	 9AQDtitwKqP0MZBaOWozB5TsuesOj8OKerpTs8kWOpY8ynlgxCUgsQRU6UeBzZXC/X
	 zAyOAf0mw+liIwyWSBFINH1NtCEQuoUCMenQvu85WCHM9r9jI4kobkGNnN+rhwyV6q
	 YyGXGZjsKIGVfwJLjYMdZc/YzmMGVY7YxFgwv/lAq9UcOvazKzNgRTU+tsVhgj1+1J
	 yqD8RgtCJ+cEw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3ECD3645CA;
	Thu, 26 Mar 2026 10:55:04 +0800 (AWST)
Message-ID: <4afeb8eaa663835725cebaeb8c1b6f50dce184dd.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: first batch of fixes for v7.0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:25:03 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soc@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-3772-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:dkim,codeconstruct.com.au:mid]
X-Rspamd-Queue-Id: 7B05232E879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello SoC maintainers,

I've been intending to send out this fix PR for a while now, but time
has escaped me recently.

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.0-fixes-0

for you to fetch changes up to 7ec1bd3d9be671d04325b9e06149b8813f6a4836:

  soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching (20=
26-02-23 09:43:21 +1030)

----------------------------------------------------------------
aspeed: first batch of fixes for v7.0

----------------------------------------------------------------
Potin Lai (1):
      soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching

 drivers/soc/aspeed/aspeed-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


