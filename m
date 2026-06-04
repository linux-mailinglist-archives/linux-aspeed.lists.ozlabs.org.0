Return-Path: <linux-aspeed+bounces-4185-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1uCBebKIGre7wAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4185-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 04 Jun 2026 02:46:30 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110463C197
	for <lists+linux-aspeed@lfdr.de>; Thu, 04 Jun 2026 02:46:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=CVv5ds54;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4185-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4185-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gW5VB0hxtz2yS6;
	Thu, 04 Jun 2026 10:46:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780533985;
	cv=none; b=Y6xSyJinCPtY0Uxm9b9VSbg8/aza30FECvyLJk4UJrsPod9mp4FLIWPAx99kKSzpzLDMQYUzj175PtpvPT73LBqeX80OQqczyllXWO7m+UYyCFbb8eDIGad9VJDTz0LTHeTZP19zEqSi8R6HM+YD12Xf42cG6LwQOocxntE58WJA99BvL6ozber+jDkHQr0tFNb6C9H70YEyi8yl6hMkVJXLMuh//DQLItHO6MDcyHuxp4NUptbQb9lrhl3AoG69odgdFJefc77GnYm3smAMwoV562MGSUife0grCEjz1/2WPkVvCDGRIaSDomPZWjXwmi5lyCA6CLhsNDPIdyV/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780533985; c=relaxed/relaxed;
	bh=2eXLg7+UTj+6M1socVzRC9ljt9/JbCjjIXt/BSPxboo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pu5fZXUvdAIdQUUZaKXSBIqIMTvlgIIhH9chfesfcfRasnukvuyiiHsLfyaKQz2mZb6IPVtxCgabesFEQfzHhoNKDbTiUw6xlNLVsdC1kU8E6ThQ9/iCmheFtDcMomOwWeXhq8GFMS1+SuahnidYOEo30qR4CXac4W/V5fmsL40af5C7O/dj9wxLVpqwVFrSqGLuB9vkmTkxmtealhbKY2eKerSEoagjzN3J2IR+Q5u1PdR6sXEpUF0A2NgGNfYKyF4rvs1WtJlIwWCTH4eiQ8ZLY+tAncIjKe4w18cIOgSoLyXCJ6UPwuArPViLz19qEJOjsxWXyp427UT2r+gi2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CVv5ds54; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gW5V85HZVz2xF8
	for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jun 2026 10:46:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780533984;
	bh=2eXLg7+UTj+6M1socVzRC9ljt9/JbCjjIXt/BSPxboo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CVv5ds54j2tEMkFa79CFllq32/Z8FIgSA/RsoPnNTkAtg8wb+SE4WQjpXhqatfnsD
	 K+d0MF5P96nBL4zxDgyvBPcpV395qpnRustt1HWYRUi8yy2XyeYPZh8AvhfmqV9jV5
	 SMCNOlWH1czQADzOIhgn6SWURqgHjoNkvd4Oo3etTPPn1bX7ylIN/Uvin56yWPN3R5
	 fdBKGur4lRUfUXdk99+h2GdZ10ogAAwWyOSppCgVEe17s2kYmGRbHPE8AjOYXBaAiO
	 /aU8AZ0tVpdHzQ0js0iwf0JdM3W+hb+GBAMzbixN+YCU6i3LA+6ihBoTgkEPh2kw30
	 dictAnWtyQq8w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9D7860087;
	Thu,  4 Jun 2026 08:46:23 +0800 (AWST)
Message-ID: <3b4fec04093d4f890a67df8b3d2e255b220d776f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] soc: aspeed: add host-side PCIe BMC device driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, 
	ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 04 Jun 2026 10:16:23 +0930
In-Reply-To: <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
	 <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
	 <ecc3bd49-829f-49b8-b3b1-4f16363ea5b9@lunn.ch>
	 <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
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
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4185-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregoire.layet@9elements.com,m:andrew@lunn.ch,m:joel@jms.id.au,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2110463C197

On Wed, 2026-06-03 at 15:43 +0200, Gr=C3=A9goire Layet wrote:
>=20
> For the rest of the driver (shared memory, doorbell and mailbox), you are=
 right,
> it makes more sense to implement rpmsg or virtio than just raw shared
> memory binding.
> These are software-defined communication channels and not hardware-emulat=
ed,
> so they would fit better as rpmsg or virtio drivers.
> I took the SDK driver as a starting point without questioning its structu=
re.
> I have verified the VUART was working correctly with the shared
> memory, doorbell and mailbox setup removed.
> I can split this into VUART only and defer the rest for a separate
> rpmsg/virtio work.
>=20
> So I propose for v2:
> - Remove the shared memory device, the sysfs doorbell and the mailbox
> from this series.
> - Retain only the required configuration and initialisation on the BMC
> side driver.
> =C2=A0 This should mainly be SCU and PCIe device configuration but other
> initialisation will be reviewed to determine what is required.
> - The shared memory, doorbell and mailbox features could then be
> addressed in a separate future series, likely as virtio based driver.
>=20
> Would that be acceptable?

That sounds good to me.

From a brief inspection the driver also had support for both the 2600
and 2700. Something to consider is just supporting one of those for
now, and adding support for the other in later patches.

Andrew

