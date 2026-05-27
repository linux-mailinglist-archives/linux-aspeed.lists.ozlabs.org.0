Return-Path: <linux-aspeed+bounces-4132-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGAPFMJRFmqPlAcAu9opvQ
	(envelope-from <linux-aspeed+bounces-4132-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2026 04:06:58 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27E5DE77E
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2026 04:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gQCfk33C3z2yTH;
	Wed, 27 May 2026 12:06:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779847614;
	cv=none; b=B2uz2+IZ1xuE9mVdAAGEAfBV834TvzV0BvcU1BCIhMLQ0D/uh9OB7jlerZqgvEx4s5gIwbwIfak+IONQqb1aktx56un2p4rCgGHrEoJoLYL8nD+0No5U3fjd/6wYsADHG/yKp2FjxWQjIxSC5alQqjeqbgSUxkbU7ObocFwH4ne6BIZuCyFxeJkvlcjaLEKiSCCA5VIl+ywwWmI6HOcuYJm50ykzBJdnLOoijk1BL+hu2ufTDv6YnBMLUDLmpAGw/VWH/8YulRNEmF6AGNIERrtxwR3LnBDkiZV2tPIX7GjySyUN3ZQKJmngl9QzNwbriFzpaI77tpol7i+gVf9jUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779847614; c=relaxed/relaxed;
	bh=aUaXtE7+Lpu6T9R6qedWabPBNZj9Omh3QoTrbc8F0Kc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ineBEsv/mCrvRo0hsNdr9gJenPj68XUxa8e4Dg1iVMrOSjtyUHdwfk3d7dmY/uMsiyJKEE3ByAH6FBLGIQw/FKl+y9poTuqOcRPg4vIq/05tmqHDZgymOdkNOCiy7jlE3eoQIksxSF4VgIoLOT/lA3GJPxuuG64cqs/gFvscI/Tu0sOFe93UmgteBBg0qMdWfT5KOBo0EYkh3HDguOY8dKwCuFF90ebj9gLfMofRdXHSs2iKkCrUyFePMP9ja6ICOnhK91Kxmak1qFc1RGAYrPCm1464dE+F1F7CX1b2A3cRMxX3JZZ/f43YKtcN2s67sqVrP3KoOsfpbEkfOLNzPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QudllnWK; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QudllnWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gQCfj2MxQz2xS2
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 May 2026 12:06:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779847611;
	bh=aUaXtE7+Lpu6T9R6qedWabPBNZj9Omh3QoTrbc8F0Kc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QudllnWKEx4Ncqd3j/B4pAxENZQG00b/raI64g1WXNXSkyJFxvhRo8OyqKXpXGeXV
	 l+1vU0zjGRn4lZX4s8ifV7kV43XLXGpUc6CyYaLCjzCp0Exs1mS26XNq49Lw8NJ7EO
	 Se4Zhsi3oX2QbbXFdyP78MuAnkwKp2yRLxlaDwhJJIcPKd7h9JvUE08KupTqQKQIiA
	 2S5+jyYwRXl0f1TW1oPd3ny7uEAI/Q2tSgPcgcJmTLV9y3culjJp7JHGBx8N8XBJ10
	 leeS+c87sfWWQEd0u7C6babUmMi4lQWmXCGyWwhQ59hpFyyA3Upz2hyxQqiUEFCV/4
	 FQsWPJbFsLS6A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C417607F4;
	Wed, 27 May 2026 10:06:47 +0800 (AWST)
Message-ID: <e059b59ecb9b0912ae8a044e3f745450b7095573.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Neil Cheng <neilcheng0417@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, joel@jms.id.au,
 geert+renesas@glider.be, 	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 27 May 2026 11:36:46 +0930
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
	 <cover.1779157117.git.neilcheng0417@gmail.com>
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-4132-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au,glider.be];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:neilcheng0417@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 8B27E5DE77E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Neil,

On Tue, 2026-05-19 at 10:38 +0800, Neil Cheng wrote:
> Add initial device tree support for the Meta Rainiera6 platform.
>=20
> Changes in v2:
>=20
> - reorder adc0/adc1 properties
> - add Acked-by from Conor Dooley
>=20
> This series adds:
> - Meta Rainiera6 compatible entry
> - Rainiera6 BMC DTS

In the future can you please avoid threading v2 (and later) under your
prior submissions?

Thanks,

Andrew

