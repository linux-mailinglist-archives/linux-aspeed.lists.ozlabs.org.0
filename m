Return-Path: <linux-aspeed+bounces-3963-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMeDK0gQ8GmANwEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3963-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Apr 2026 03:41:28 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376B47C7D1
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Apr 2026 03:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g4NSh0tWBz2yjp;
	Tue, 28 Apr 2026 11:41:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777340484;
	cv=none; b=NyM6EMMc5JGx9PKGJFciqxj96O/lVMAXKO7Wi3mDqY2En0iIibZAIvn04okVPp+5i3QIIY8SUvFRiJCtFXrfy+E234REdbvilveNc+nVckvCLE0l7ZF0T4HqJvycEQKkBlW4Y6Z9OVSfGMAWgkAO2wdlfH3IuQbHeIKG/iz4FxXDUSf5cPyYWWyivwPv2GiYxHf135EwhVK75Z4LK6mwSBNAgKLzPzx+4moY7XWAekFM+K8nUi5gJT8/iIPQbr9D8Kmp7X9iWKL7iXQ/w53m9wpltxBntXWSmnaxzq5aHxvGIfaxXPgY0AMzLZPtdTbAYXwVQqBh5eH6pPRgDWs7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777340484; c=relaxed/relaxed;
	bh=kS6Nhw5Xce8gKlfbWDr+Qz8JGBd5F/n/TDPtz8b6uAA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Neg31EFjZjdo/IREfV9STNuBCrOF5olyGwo6Y1uBqkDcJTSnCafnTYE5H7y49jYBZj6WLIWTcn5Fuli/kh5JWAmiuGzeNh8DWZNahVirlvpsOfoHuC9B3Zq3I53BioC83vsag4A6H4JAHjySRx2ngnTfbCIkB0ygO8cbT8flZT/T5Eil4M/BKawF4xGgd2ZxldwgNUydPUsdCpAHAEkz8SuAv+TuFg35gB60xeRyZ7WkjLSgCwrQiuq8wVz/DNStNG7Vxfe01UJEZTFVZgRIXiT1+Z+HwrubltUVFzVu1bbIjyjKjorN8HwPR9EBw8YXF1CwbrCljwHycheC+ikOUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LDcHkvqR; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LDcHkvqR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g4NSg0srlz2yYs
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Apr 2026 11:41:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94F9B60139;
	Tue, 28 Apr 2026 01:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA22C2BCB4;
	Tue, 28 Apr 2026 01:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777340479;
	bh=kS6Nhw5Xce8gKlfbWDr+Qz8JGBd5F/n/TDPtz8b6uAA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LDcHkvqREYp21fdsIvE3hqicidetzAVcadb9CaB0WYDnqYnrA8lTHHvloce1SbuxG
	 YqR/+K7fb9XNMtUTnlH02uCZH3MwxWVw/RAzzlvPIcEtSrpDEUHCYpcbf4HJb0OCgZ
	 z//4Izk2qtg2e1vAzVsbrkSC7CEGIrsoA95wzvz1+KAUUQGtxMOrqe+Qa/TFTH5E1d
	 3ZY12EXWUND7WfnXAfRxnCOfGQBlDKaixZx9rEJYbNJjW5kBR7yrzRAeB08UcpjJDJ
	 u+fg5FLNnDott4iqobSvT12fh+Up39IdmxWl7bqDDaGRvwSIX4QCmKAWDse9NegJCX
	 tVMD4hXdTsLjA==
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260302011651.94682-1-haiyuewa@163.com>
References: <20260302011651.94682-1-haiyuewa@163.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: ast2600: Add reset definition for video
From: Stephen Boyd <sboyd@kernel.org>
Cc: Haiyue Wang <haiyuewa@163.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Haiyue Wang <haiyuewa@163.com>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Date: Mon, 27 Apr 2026 17:31:28 -0700
Message-ID: <177733628897.5403.16418225590380642017@localhost.localdomain>
User-Agent: alot/0.12
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 0376B47C7D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3963-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:haiyuewa@163.com,m:mturquette@baylibre.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[sboyd@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[163.com,baylibre.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]

Quoting Haiyue Wang (2026-03-01 17:15:00)
> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> header. It is required for proper reset control of the video on the
> AST2600 SoC for aspeed-video driver.
>=20
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

