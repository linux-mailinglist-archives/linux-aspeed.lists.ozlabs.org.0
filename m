Return-Path: <linux-aspeed+bounces-4069-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE7HHXgOC2pN/gQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4069-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 15:04:56 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9010456D401
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 15:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJyh41DkBz2xpn;
	Mon, 18 May 2026 23:04:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779109492;
	cv=none; b=k5avKRle6InhTQ9DwVQ36FkFNubchUyotPv6BrmUjYA0ZdV06SeB5YqLtHwThWKHJVQ2UEkQ7Kwu/ZFDIHf26sqOWkrnzVj4n9vaxL6SQdpRDzzlwoCVIWmy8oy/lBPhgwYB+iLVSWn2XNvmp5kS/9Y49RiuFWAjazj94jxip9UAI4QjflURapR8OgIqCmELBo1eRBVjVhsh1nWveNoIrfA+GV5Xj+Y+VTvv+IsBn2SWbGP09a1buYVTZ3sErJeXvbJbL77UdTPdDrVESTgCwTbkTOrK0Wd9f6miyt1OYGAFmZT4pipDegqRpxxuE49A2UDZoTTk8dDK4CGMDyR/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779109492; c=relaxed/relaxed;
	bh=nXkhtK9o0AaX4l76E13gOxjL/F9EGYtWCFU097U+jXg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LUpmbbcYR9273ph5goMouTuTT2xzGaMxTrHMYj5PiFgCyyxYpgvtdJSJysP1mtyBEAj8yQi5n2jIn6/znPvn8VEtqDe67szRGu6In3NkTr+r0wW0Qa4tnHF6dQuHKM/OzGjE4fmUlJ2Ph/n5Nf0M3LF6JiubJENU3cT0X4rfB02+LQVX8TQN5bO5vDcC/ryEaqjHWLPMrGxmaNBIITZr9iSh0iOhq53UEqkQjL7PnNgvPyn3l+fZ9tHS1BG9wr+rzYheK/p0a/vZ2n+s3A6Nfvf1BVYdxg/U9yLr3rc/6m3J7nyWNi9DroBSBO8OZuvxzbxekb9RrpFy5r4vF/zBeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=az5fxu+W; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=az5fxu+W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJyh344Y9z2xRw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 23:04:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779109490;
	bh=nXkhtK9o0AaX4l76E13gOxjL/F9EGYtWCFU097U+jXg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=az5fxu+WtwmRgdyYCSie3SYKy39NyWthj6rK5dElNf+5B0N8CGToFYyhG99At1O9e
	 TjvDbKAw4yoOsjqj4QrEFMaRpIN5/1s/OJSl7CYnWYn0GwgiWNf+hIIij3sdIzp6dM
	 O2IMaoiSRqRNTXdWHFeXesxk8npBhzPGRRPAEVTIWyJKFkPIHZPzq/vUtTSREj+N9p
	 SzL60lusfzJSqrGnyyq7EndvF5ff7bKmRoPZZyC7yRPW7YJ3tZ9DfvzRM99SiRFEfs
	 n6pABejzCPgJJUAITQSxaZRM4k2mTkU9XfBF3n3HjxW7nMXf/ZoKDrZfolJp1dMhPw
	 j3Swt9tUd916w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 74A306025D;
	Mon, 18 May 2026 21:04:50 +0800 (AWST)
Message-ID: <1d06a4ee2ca6cec68ca241812b2a90c1fd4e153d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: g6: Add missing uart nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:34:50 +0930
In-Reply-To: <20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com>
References: <20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com>
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
X-Rspamd-Queue-Id: 9010456D401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4069-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jammy_huang@aspeedtech.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Jammy,

Sorry for the delay.

On Fri, 2026-03-27 at 09:58 +0800, Jammy Huang wrote:
> Add nodes for uart10/11/12/13.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 ++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 56 insertions(+)

Do you mind rebasing this on bmc/linux.git aspeed/arm/dt to fix the
conflict and re-sending it?

Cheers,

Andrew

