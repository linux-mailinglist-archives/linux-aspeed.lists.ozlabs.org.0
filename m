Return-Path: <linux-aspeed+bounces-4214-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6FurNvRIKWp4TgMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4214-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jun 2026 13:22:28 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA82668B4D
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jun 2026 13:22:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=LVch8VCH;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4214-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4214-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb3KF62Npz2yfD;
	Wed, 10 Jun 2026 21:22:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781090545;
	cv=none; b=POZW1hdrGU8S9hiGmoX+osiYF+FpvmzMyiXiqDO5j0l3p6cLmMCJ7O6FA795CNTckvqgPsQX6SfB1VInibrEUiEy1RrJj0VYK6aHaSvKTUecbeo60xZjynhuWv5DkE2vd4SLffyk7hu+mNzMiHS8KL1jBEXEFnNInPYLdzcGZd17Sb+W14oY92eLEuWio8D6FnFThaGVhZJ/hIGuFLsGRIxpzsdwI+Rfej8KoOcfE/2xxKqok/5FcV6lMEMufZrd5ZMfO4mT2OFl0Md+1BllggmMzJ1x9jNyHXnTWwECNLykPRRwF89FdBXFBxPzf21/5o2T0REscyL2xu3uZgqDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781090545; c=relaxed/relaxed;
	bh=aBDEY71A7aCboQvqZmdLZCfK9+flfFgYZqgP3Td8iQw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JlVB479VrqZ8lwl0ASKTyko0YGuk5s0idDkF9mMhH7bYKEOxiOxUJsG1kNLS4zFvv7i/RL5KUa5bMRyp5dMHY9SdOKR248m7E0/4wlAUSkqzPNJsC+wT5w319iUQcaHCWUh9kN4L/Sh8iQV3PYwWwSkOO8xN9HdcIwto4hKxUmIRRYE+IDDRLSxbZKcYJEkEB09fZ8mRwv2vQnv9iy2c1/nfMF1eEtTmZ3QMQ+I4AA1u3IVwY4m9B4z2NU5KN1vsJ6Doqq9A6OBL2B3WE30s0UOHsVuy1qUH25E/0LhOVahVai32WTFYaxpX0DpK2wDvXrrhhFOJ1f2LCY46GH20RQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LVch8VCH; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb3KF1YGhz2xdb
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jun 2026 21:22:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781090544;
	bh=aBDEY71A7aCboQvqZmdLZCfK9+flfFgYZqgP3Td8iQw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LVch8VCH0zomK1nWEJ90cjd/By0E1ewlQ5r2fkj526WecOoevRMgO1i6dynMrgDSC
	 CMKfHYRsoLGH5A6+q/WeH4LpdgVjogq8E6BWaft5NDo8vMO5YB6DxQO+BFizdyoToY
	 +SnQjofpJeFRyril0GtxrqlER1F89XaqcmaC9W/+RyoGBFHJTtxx+SlGRCPRSHzBFE
	 lZjas42RoA5evv+8gaWjzM0IN+KYkV3pni3kb+J09X1dg5bJ+pPZZhvIZL//ZHpRHW
	 MxUFftFZQ3jez5zOGwZ3jnQ1sIoaP7BCTa8OzmYR/Ed6kNmaWIydKoW1s2SogFhFR4
	 IkdElg6fpkrLg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EFA2C60A14;
	Wed, 10 Jun 2026 19:22:23 +0800 (AWST)
Message-ID: <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 20:52:23 +0930
In-Reply-To: <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
	 <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4214-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kylehsieh1995@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:dkim,codeconstruct.com.au:mid,codeconstruct.com.au:from_mime,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BA82668B4D

Hi Kyle,

On Wed, 2026-06-10 at 09:22 +0800, Kyle Hsieh wrote:
> Add linux device tree entry related to the Meta(Facebook) rmc-node.
> The system uses an AT2600 BMC.
> This node is named "ventura2".
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>

I have some comments on v5 that are applicable here too.

https://lore.kernel.org/all/3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@=
codeconstruct.com.au/

Andrew

