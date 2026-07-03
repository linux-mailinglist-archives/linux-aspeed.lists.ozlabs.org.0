Return-Path: <linux-aspeed+bounces-4339-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G+tZAmaGR2piaAAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4339-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 03 Jul 2026 11:52:38 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF9700D60
	for <lists+linux-aspeed@lfdr.de>; Fri, 03 Jul 2026 11:52:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Xcv7NoB9;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4339-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4339-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gs8Dy6p7Jz2xdb;
	Fri, 03 Jul 2026 19:52:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783072354;
	cv=none; b=Af0n/EiqjhHZSY5f+TciKMpDy+cDUxTfEgy8EE3cdvdJeCFfGTkX0Ikqjhu5r0JVmc42TaZj1iUe9Zqgg2gw/W48edI5oDRSFN04/9G+rPAfSUICPRbwtAnm3tVgn8v08iVGy3PnjRYdRPGRJXb29ujygM0OHaLoT5mcxyyl8YPUggDqok2FHth52oen4NI6Ps2TARxV7VOAleoItuQQBW5f7wYEuIxZKhI3ovPHhICtCFM9oVNNQHJdvGDcRx20EqhyoWAwZwZBRGowVSxpXAGn3ZjpTn0gzlHwpItlBPH2dU5T4RAnr4inO4+mxCwSixkEl++5bUqzA8Z7O+4c/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783072354; c=relaxed/relaxed;
	bh=GKEsNOedviw9g/4cQlmclfv8VVYF3FHxpuZoJOIlKeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7LhHGslvVKGTOrQbAsFeYrfdUc2WUFvAatydVHs02Ct9VEHmjM0JkZicDr4doa5QyJBuQpvxWST5WTxtBDeifMjTEuqEquPY2wmTXTHwBm2EOP8MqLmAbPecjIeu7zw4cpRqfgBIZDt8J0sXvqyKwYkN2Dovxd3But5lWMGBj5iYesLYHu2tA+QcYedKMqECxgAttB9nwTnYtwTUYI5T/XnEreGVp4qkoK6QBW9QxeBSgUCXELDyodOXkp8pLPG8yFZOVeNwja4XgpCZCir/ULkd3R09hM9ftTP7NGm6gLq2yVRRR6dMeN5qCqWnflpXqcYX3fS6+kaHSVZFfijww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xcv7NoB9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gs8Dy29Zvz2xPb
	for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Jul 2026 19:52:34 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79F1543C74;
	Fri,  3 Jul 2026 09:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E3F1F000E9;
	Fri,  3 Jul 2026 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072352;
	bh=GKEsNOedviw9g/4cQlmclfv8VVYF3FHxpuZoJOIlKeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xcv7NoB9dWDICdJH7Zmx1qdxndTSrCEdI5rFcOUWYAeyLCTvqi7Bh2XZLgBb7VAqs
	 loylffvgv5wbLH/csdbg/lZ2dLeOWGi1MnY/p6y6PEuboKaEifao0IaXfkpE36seh4
	 4l/CkYblQwGC6PyXsvXHVqn0rnYWIsgnbDQ0UZYwxKqP9CsQQMBs5bDG+WXMF6rVrx
	 S6hcecZD8fgXaBOy/ahwWrorBeYT8SwOA+svrqIwlUE01VSIqPwaDyPQWjZtIxw2Iz
	 qVEgZbXZ9WaN7UHXq+AeCOS1VJe9jCe/A05VA92F1b7uA5vF0NXNBzSytOzbjMm/yr
	 p+5knsIq9hJkA==
Date: Fri, 3 Jul 2026 11:52:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Message-ID: <20260703-prodigious-coyote-of-culture-11ddcb@quoll>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
 <20260702165524.2168091-2-jackyhuang@nvidia.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702165524.2168091-2-jackyhuang@nvidia.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4339-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jackyhuang@nvidia.com,m:andrew@codeconstruct.com.au,m:joel@jms.id.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22DF9700D60

On Fri, Jul 03, 2026 at 01:55:23AM +0900, Jacky Huang wrote:
> Add NVIDIA's VR-NVL BMC board compatible.
> 
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


