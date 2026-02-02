Return-Path: <linux-aspeed+bounces-3460-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPf9KmH3gGmxDQMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3460-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Feb 2026 20:13:37 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCAD06AB
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Feb 2026 20:13:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4bqx2YqFz30BR;
	Tue, 03 Feb 2026 06:13:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770059613;
	cv=none; b=SgV5zG6+KjLwfCVeHrcMXpg14LELm6lBqrhMuWWvTwT7Og9hU+gU5NdBtRvlzviEcaQflLFlj8sPJra6kBhoExOhMAK/8Pn4xkW+XBuaYO1ceb/bPyQ0U0N+zYctPYaj5KCY+h2oVdemLNFvV5iTqZfjIgMi7Ps5p1UWs6Sx8OW6CIa5AVjH2QVcP92bzKH4Db2fwC+YoAYkno49yIiGN67tvgMuvenGahiYdi+YHdjC8gwwi7UCW4ICjCiMgetOdjTKPIv/b+y/QyZj/hjXcGRmrMYbdTjfH5HkMuyhAvCi+NMVK2c5VUSG+AT15YMd/L7ZEBFwQwBOs2oVrIuNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770059613; c=relaxed/relaxed;
	bh=2VU7aHOI3OjGlEUiCW6SkZgmY2ThX7FZLCasJM3grOg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Nw/288lxc8+clQe83UkpNzIfzbTlU+FD+VJjBVKyg/Ra4fb+kSp9BTkyY3C5BpUXzI2EmtxpvRwCJoK4n4KuE6rj/0880tju+5WlE3dxhpGMgKKKqNGcA0KIedLvWZQUewaPUZQEicrzyfUSjbf+iHHxuo97l4z9xSXEjB1DOkSfUb3WMjqYzz99wVufy7xJjQysy98qm2UbbLcRZ1yF8n7zHEcLYrNUG+k5Xre+9noaueokB9zWp778scrRYRt2bDuU4yCQJ/1eYqYZp8merOfkcfbQDLGDI9mWwV315L/SYfg/NzoyOYDrncDg658q7kIVhG17d0H8PdPxWSSHaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RmtaV1iI; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RmtaV1iI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4bqw4qMRz2xpn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Feb 2026 06:13:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3371C42E34;
	Mon,  2 Feb 2026 19:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DE2C116C6;
	Mon,  2 Feb 2026 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770059610;
	bh=2VU7aHOI3OjGlEUiCW6SkZgmY2ThX7FZLCasJM3grOg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RmtaV1iIJwUw4HXt6wcW5uajoZYRuhY+4MZnW1vFkHsVQV1XjwtmvIQd1vCQA9i4d
	 gWxQmC1mMBKkhUlXJp2/t7Pi7UYbzExahLIS2t09vlTH7UP79OblMvVK2htKSEyzKD
	 rWQr6oiJb9OWsEVqCjH1Y04VRwJIhhIjzmZm/+nBESDlDUDH/hI/JbiRGcqZ5dx3QI
	 LyZid7GZJGhntlNoN0nks09wAtdtZ0o8KyFJLkl4maZGfolkE431wICjhII0HNqywr
	 /UsVvobg99bAm/zqam2JYxHyrTd90Xd16O4qkCnwbGIQOE2iM66QKrcDD+xQRk2jt5
	 P1DlWyzeX2MCQ==
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
In-Reply-To: <OSQPR06MB72521F40C1F2CD858B8D83FB8B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <OSQPR06MB72521F40C1F2CD858B8D83FB8B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
Subject: Re: [GIT PULL] ASPEED clk updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, mturquette@baylibre.com <mturquette@baylibre.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
To:
Date: Mon, 02 Feb 2026 12:13:27 -0700
Message-ID: <177005960797.4027.14390177024032129085@lazor>
User-Agent: alot/0.11
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sboyd@kernel.org,linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3460-lists,linux-aspeed=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryan_chen@aspeedtech.com,m:mturquette@baylibre.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E9FCAD06AB
X-Rspamd-Action: no action

Quoting Billy Tsai (2026-01-28 19:36:24)
> Hi Stephen,
>=20
> Please pull the following ASPEED clock driver updates for v6.20.
>=20
> The series includes:
> - Reorganization of ASPEED clock drivers under drivers/clk/aspeed/
> - MAINTAINERS updates for ASPEED clock drivers
> - New ASPEED clock driver support
>=20
> The branch is based on v6.19-rc1 as requested.
>=20
> Thanks,
>=20
> Billy
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

