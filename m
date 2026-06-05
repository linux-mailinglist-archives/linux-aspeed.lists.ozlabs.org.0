Return-Path: <linux-aspeed+bounces-4187-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ad6VLd4bImo+SgEAu9opvQ
	(envelope-from <linux-aspeed+bounces-4187-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 05 Jun 2026 02:44:14 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC9644261
	for <lists+linux-aspeed@lfdr.de>; Fri, 05 Jun 2026 02:44:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=ZloprKCo;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4187-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4187-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gWjP12d7xz2yRM;
	Fri, 05 Jun 2026 10:44:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780620245;
	cv=none; b=nTuCTNbcj87nS8Z2fi7PLh0nY7yNJRGE925RC99vN9r7rYKCgBDwi+K11TL3dUt4PF6rl+/nBjU7f1cqaOb20PLxs6GGBEgFVutatUg8P2WUDVNqVCUnRfmSQH2OybC6NCZeNj4M8CMlCVMfUxa2xAvDpH2DeZaJGql/eJUFFqPb0tAfHvsNUKFy+mCTzq8tnftUSQRMtoUrxb8jJoAMli9PcWev/FeB5t0ZxD3larZcYA9qWJYB8/FdgPCFrX8y+hk3qJH1PJVvr7AxY5EyUHbdTrsFiJmJm0uuxh0ihq25GSKiUNpic30qSLQmCMzUtoZ0sWNnAjAKo30e+4D5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780620245; c=relaxed/relaxed;
	bh=jsj1k0wHi26GAkypB6QUIJqC1oJwhVzc1i56Db1iD/Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DoTBmdlc1Ed51/5g0tMFHjtVhqTBsKMhq144/mAz1rMtUGmvBNSxx8/keLWbaC3SKP6vZeENNUCESDyM2SR9ZwSnZX2XM+T+Cntzg8G/1vWRI0xtXbuPXRpUFUEE7nG7FKhidS7wsTMK1zP6Jy4qWQwyQORPu9N+34UeX/r93VTsF4x8OykxCP/C1OeHcT+ovSHjsqHvBCYc9NSRbG8fZEXNRgnY7iXxvb0NErsUHJohbZf6GHrJ2ym1nPjE04J9X7Wc3seKj5HmUq3qtfdqZ+V+EtLbUC0sm5511ZmPwTOrlzdg2NDLpqDrT+j+XOoz/7DP7drFSwdZFOsa93QNfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZloprKCo; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gWjNz41cXz2xR4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 05 Jun 2026 10:44:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780620241;
	bh=jsj1k0wHi26GAkypB6QUIJqC1oJwhVzc1i56Db1iD/Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZloprKCoX5TNbNEPdKftTMY6jPQai4UHIv8xuzYMMAW63DXTDsjdtaGphRix8B1EL
	 AIWw4/scrV1UPtHbLqV5OaWdPT8rMfT21f7X8Pe0R8P//3NLgIT7ahtwjIc26E40yn
	 GEuPBXect43k/BQgPksH/3n43NAcxwIe2bNCl66hs/WBuwV9tCxzTm38c6l/bI0ova
	 mRmOr1VUUxbj1SNXcDm7yRjyjleLLu1d0fPWzFQRrp8RDCcpv4vq/9f/plk01hK5zm
	 XuCUQ83LILf14iJSNxuWw2vM4twD7zfH9MXf29u0UjGNHjlZcTiEG+svE/RZndnp6G
	 xGRqX0Bwk0I1Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C193F6013C;
	Fri,  5 Jun 2026 08:43:59 +0800 (AWST)
Message-ID: <91f6780b688285b4c002d2efadc7b297e9d69838.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/3] dt-bindings: mfd: syscon: add
 aspeed,ast2600-i3c-global compatible
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Dawid Glazik	
 <dawid.glazik@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, 	linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	maciej.lawniczak@intel.com
Date: Fri, 05 Jun 2026 10:13:58 +0930
In-Reply-To: <20260425-poised-accomplished-hyena-d2c1a0@quoll>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
	 <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>
	 <20260425-poised-accomplished-hyena-d2c1a0@quoll>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4187-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:krzk@kernel.org,m:dawid.glazik@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:linux-aspeed@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:maciej.lawniczak@intel.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9AC9644261

Hi Lee,

On Sat, 2026-04-25 at 11:40 +0200, Krzysztof Kozlowski wrote:
> On Fri, Apr 24, 2026 at 10:21:00PM +0200, Dawid Glazik wrote:
> > Add aspeed,ast2600-i3c-global to the syscon binding compatible
> > lists to document the AST2600 I3C global register syscon node.
> >=20
> > Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for applying the AST2700 SoC1 pinctrl binding[1].

Can you pick this one up too? I've applied the corresponding dts patch
to the BMC tree, it'd be great to address the warning that's currently
produced.

Cheers,

Andrew

[1]: https://lore.kernel.org/all/20260521-pinctrl-single-bit-v5-1-308be2c16=
0fc@aspeedtech.com/


