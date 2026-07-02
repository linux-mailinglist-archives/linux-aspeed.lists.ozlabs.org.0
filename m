Return-Path: <linux-aspeed+bounces-4331-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 18f0MPuvRWqNDwsAu9opvQ
	(envelope-from <linux-aspeed+bounces-4331-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 02 Jul 2026 02:25:31 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EEE6F298A
	for <lists+linux-aspeed@lfdr.de>; Thu, 02 Jul 2026 02:25:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=h3bv4x2W;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4331-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4331-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4grHj34Bllz2yfD;
	Thu, 02 Jul 2026 10:25:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782951927;
	cv=none; b=igsBTaReo+xWDOrDr0z1VFVOZJfWAdpbPjnvJB6650Wx/7muta4BUBLQ4G5+MPUjPUYOtSmDdbauBAXedvGirQ6Lof5PzF2Z5GLRiXR3sUJsnAleEkTXuy5MdF8QkoZwkp4oXAgk0BBSGX0AFcwvxixYKUXm2Orhtpgaq/mMX0TAIsv5VwR7wWInafDTqNkndb/dI3hAs1umTmUg0AtRilq8MdfeCXX3TyDK2RNqTp9BCOzBxoW7CTZ/fMq4+X0JUDuu+an5au5sbE/xTx4heIn0+sl+JnMGrZmRAWW6f/6z0c314w308t5uZ9WD+z/87yvYujm7/D/KU54g4iQ79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782951927; c=relaxed/relaxed;
	bh=b23V63BD9BdyYV2a2cLuU4Mh+dF+RSGxaY+1gI7BIEU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e24nO+VQFvCKBm48HCdqpOIooh/i1ChLTOE+jmi5AYryEoacyP3sReH/kaAx0S7+X7E0V0Eq295LVMhIKoz6X29AjbYms4ziKKl7WHqm32uZ8paMLjYO3YH2rK/ENbk5urkBFW+pGhOb4Duxo8obXHmr86oqZMQHh/xvb8TDwxKXqSHoX7u6+4WX6p2WKwmEzffynrK+2/MbOL/0rMFtTM+9wQJNRbNE/LijAEA52pq1Xz9HRFYlRnc4iJds/RKZfxbpeC353Op8t6lpaytSgyanIzXek8Mz+pNyWIunDt0mxDCN7DVaYdi9+LoI10L0b/vtJf6fuPrBr6nKzbL5jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=h3bv4x2W; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4grHj25hP0z2yf9
	for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Jul 2026 10:25:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1782951925;
	bh=b23V63BD9BdyYV2a2cLuU4Mh+dF+RSGxaY+1gI7BIEU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h3bv4x2WU3f1qVa7wLIOYvub7fxttSM9mZv8n11Vg4VoIPKJIsENJXvbd+HN3ds0M
	 cNISPiqb448GaEdzSxe5INSLK1lnf5MpWUaVphXrhLC2jQh4ncUfEdnPHBL+RuQeKs
	 +wGvEbXl5aZ3PeTvwmt+3z8oz3eXWAJGGk7SrnnlNbDg0ev2NzTvfzw8XK4vHiEkmd
	 F9sQLOXnw7VPGED1Zvqi82Gpr6J/HfVYUbWIYf5w2n7mkSR3ny0AeN1/6cPPWmQQ4x
	 scUrVFdffYKE8fBRFXe9Uc0GRxKAUcwpnpMzfcoT47eg29b5eVu97Edxvh2UA36dot
	 GGbRjlpj+sJ+g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0162A65871;
	Thu,  2 Jul 2026 08:25:23 +0800 (AWST)
Message-ID: <33cf45f92e4aa2ca985501807c3e4f74e1a10032.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Date: Thu, 02 Jul 2026 09:55:23 +0930
In-Reply-To: <20260701171506.338614-1-karthiproffesional@gmail.com>
References: 
	<033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260701171506.338614-1-karthiproffesional@gmail.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-4331-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:karthiproffesional@gmail.com,m:joel@jms.id.au,m:andrew@aj.id.au,m:kees@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:dkim,codeconstruct.com.au:mid,codeconstruct.com.au:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3EEE6F298A

Hi,

On Wed, 2026-07-01 at 17:15 +0000, Karthikeyan KS wrote:
> Hi Andrew,
>=20
> Just following up, it's been about two weeks since I shared the
> hardware validation results. I believe I've addressed the questions
> raised in the thread, but please let me know if there's anything
> else you'd like me to do.

Nothing further required on your part. I intend to apply it, however am
working through some other priorities.

Thanks,

Andrew

