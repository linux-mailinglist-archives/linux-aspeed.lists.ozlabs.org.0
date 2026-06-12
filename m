Return-Path: <linux-aspeed+bounces-4244-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uSdlKC1VK2pW7AMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4244-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jun 2026 02:39:09 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D1675F62
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jun 2026 02:39:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=bNCUDtnc;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4244-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4244-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gc0y11pJmz2ykX;
	Fri, 12 Jun 2026 10:39:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781224745;
	cv=none; b=QkYdR709oF0i1ASOeg7lEib/Lmh33wP9yTzNluXXbgMK8Vm6dhIbhENz/D4gQ/Ure+Ue5Y1QM+geSQJX/jCgZdX/HevdDnB9zmmx9iCG5DOhBSQjXVYrSGpLZLIQ9AXzvvmEfhiDZT+F4kMWYTu5Z+7I61lcMQEQKKUKNBq4qsaxHwLdy6qtKnc8GpN0qr8iDPm193UZnUUPRuQOCS39SUcsgphAlMZz4PVT8vKAv0JlSnPQ4N86XAp0bIv1efCaEuJI6y50pFekMBWWMdtJzMyBmzqPECb9tSMwt3hsv5GWOwZxpojdIwiO4WI9ikhmkMV8hDM6urjPSt8kYYrdzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781224745; c=relaxed/relaxed;
	bh=izL0j4eEPLcRk3oT8/yUGunO6coycfc6sbBDJ25Cu4Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WTFTRvLl+bRajN1oQ8mbHDAg2l20hsXzr65b5KmSpROK9UL0zULE4/SCyksDwDgD5gxArmtm/91hycr9vdn3hiZzlZr9CEH0FWcJbMnjRGTSlh4xILZMQrDtbaRD/uF0HyZ6suChcqojqV5bwjiCugNZbdm5kIX7EYi7uhExn1X4BMLw334Gl57GtJF0Ou7UoMYLR2OEjmDmNu/g/LhsaN977empqbiJv8AQBZu643dhHpmS9/O7pbZLEC4DxQ14kYpy46dIHjgEyQe/F1r3ppH66WgQMvpMbPJzOZ/gZ5X3gRA353ikeIkW29UWpRBSVKlCi8yEGzTZObDon/uqIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bNCUDtnc; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gc0y0084dz2xl6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jun 2026 10:39:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781224742;
	bh=izL0j4eEPLcRk3oT8/yUGunO6coycfc6sbBDJ25Cu4Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bNCUDtncB3TwH5DnGhWuYj9Awj9cB0VYxeNn+Bh+3DPjyU4iCsRDrBAz7lyShcWek
	 4OXgORZBkvjDoRCXol7F11hZu7b+EvOKUfM/sT2ewNRdRBLc9viKBvI/rV9VpjfBEQ
	 BCByz5Id+HGAlSwdI9Ruh/Kd/amKdbqe6RqHdK6XiuAoID9kQryoAJdn0tkGJM6KB3
	 rOoVwv0mvT7iiZFt4491QSTiuY87OPylPaFDc4CZXY9gG7a6l12QB7Q9L2HVo6c7Cj
	 gTBMRvJOE2U3+J8jqzqDHYggMMwYwOS3b4Vz1GC13aR2A4i+ONLuOo/iNoZ7DZ2QsA
	 XPrqaEgokFjKQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 45D6E60931;
	Fri, 12 Jun 2026 08:39:01 +0800 (AWST)
Message-ID: <7db557b8f6fc5751b19b148fc6afc4ad7ec2d1e1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: karthikeyan K S <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	stable@vger.kernel.org
Date: Fri, 12 Jun 2026 10:09:00 +0930
In-Reply-To: <CAP_JKPu9MTpMUZmg9BY3sxGhmBzgR0E6HnvAT7sQjVUpQp0dSQ@mail.gmail.com>
References: 
	<033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260610172310.163321-1-karthiproffesional@gmail.com>
	 <64f8d88bf4cd72d8120baaa304dfe34bb66cbe0b.camel@codeconstruct.com.au>
	 <CAP_JKPu9MTpMUZmg9BY3sxGhmBzgR0E6HnvAT7sQjVUpQp0dSQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-4244-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:karthiproffesional@gmail.com,m:joel@jms.id.au,m:andrew@aj.id.au,m:kees@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE8D1675F62

On Thu, 2026-06-11 at 23:01 +0530, karthikeyan K S wrote:
> Thanks Andrew. The __guarded_by annotation and context analysis integrati=
on
> look good, I wasn't aware of that infrastructure.
> Thanks for applying those changes on top.

Sorry, on reflection I chose my words poorly there. I applied that
patch I pasted on top as an experiment on my end. I haven't yet added
your patch to the fixes branch.

Do you mind integrating that rework, testing, and then sending the
result?

Cheers,

Andrew

