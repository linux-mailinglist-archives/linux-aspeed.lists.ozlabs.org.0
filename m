Return-Path: <linux-aspeed+bounces-4184-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwuzNF7KIGq/7wAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4184-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 04 Jun 2026 02:44:14 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEF363C14A
	for <lists+linux-aspeed@lfdr.de>; Thu, 04 Jun 2026 02:44:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=OQHG4L6g;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4184-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4184-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gW5RY2ws8z2yS6;
	Thu, 04 Jun 2026 10:44:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780533849;
	cv=none; b=Bwl+XhL5y/kQX7GVpE7MSgxIsA0kTZLp9JNCLSFFnsKHcbFjzdtdmcdLBsjCxtbB4z2OFIsxKEwoVPpHM6JdqMCHLnYXxznGS9HkQpUn29IKO5UMobFXgAWnfZsmZkSQQQOaZl+j2BKh5gUMunQw3DT1iVfb8DKnB8R7TDHlR7xLdokbu0Dt/UFpHGqobRUyQOjyi7tYnXjD/zH0tgxp+AlQyk7xYSEjXPdDlMKWcVTSKNkOVkN87EJmqFv9zqnZUMtbl3ZrCYaEq59qcdiY2hfgFQHuQJlgcAXRjcyT8G2mI35sinf+CaPmHGDLzRyfmtY5jmSbXUu2OZS83JUFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780533849; c=relaxed/relaxed;
	bh=WViDnFCt/53zZbNSkHdGljjmM4CdgEj/SmGmLtUaRpM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ob9M0kgHHZZG5X3KC17w0joYGjzHWXGNcENsy7p7ZJb2WgbrQqyNIFrfHauSMuYKvgeoMCEeSTNGUvgPBQQUMJ9ZvXgxS3s1lGQuCEnu4ZM7lB3XQz9C5WJcsndR4F5GGBfznsPHUv4IG2eOTVi2VmejZSg8xs4jna7TxM85Mx8cHHF4J0VHPcdeK1ZZsK44XUpPg3cUpWV3Hqmh76OKStnzfbLkqm36HF8pxoVBrq6CGFNcltlvnPgS1ipiqqMkHv7/iLHEBYt7ChwwvvE18cmTdAI4ZjKcL/NQcB+NE3oqzFrUO0mRP+8O5n1rlo194v/oFB5D0TvAgASn5mooIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OQHG4L6g; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gW5RW6qByz2xF8
	for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jun 2026 10:44:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780533846;
	bh=WViDnFCt/53zZbNSkHdGljjmM4CdgEj/SmGmLtUaRpM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OQHG4L6gZtKNWzS2bY6TgmSx46oPhsaeYK1rEiwiJoFnlr0JzVgO3rXzJm73ycREJ
	 fyya/WEj9/15BXXvVYonPRSaUitrXxDZRLQ0cteWDOg1Id/1lD81xoRdOdkr16eCHB
	 8fI7Kn+KJHFW8NgYmWV2gPmx1N+WdURW+kKsr4eiLTYPzPuIbk2kg1pQad2A1jwMAL
	 K+KbM40QCAcHGV6hexj5GhhGuLNP6QlomKiBAOSgj8m6jKUhUjIkFQHAwEBqe/6CQh
	 exNwKi3TLCn9rypG1b0WF5tJ1hW8l7rNcckmSjMd94XbQadU3SwR4GFlknkIapUEl6
	 X28Nj0tPFbNMA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C556B60288;
	Thu,  4 Jun 2026 08:44:04 +0800 (AWST)
Message-ID: <b45e426913823946871d429d24eeb955718464ae.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] soc: aspeed: add host-side PCIe BMC device driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andrew Lunn <andrew@lunn.ch>, =?ISO-8859-1?Q?Gr=E9goire?= Layet
	 <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, 
	ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 04 Jun 2026 10:14:03 +0930
In-Reply-To: <77464543-f793-4441-9fce-8666ba1c3d66@lunn.ch>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
	 <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
	 <ecc3bd49-829f-49b8-b3b1-4f16363ea5b9@lunn.ch>
	 <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
	 <77464543-f793-4441-9fce-8666ba1c3d66@lunn.ch>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4184-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:gregoire.layet@9elements.com,m:joel@jms.id.au,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
X-Rspamd-Queue-Id: 2CEF363C14A

On Wed, 2026-06-03 at 16:30 +0200, Andrew Lunn wrote:
> On Wed, Jun 03, 2026 at 03:43:36PM +0200, Gr=C3=A9goire Layet wrote:
> > > How virtual is this? Is this directly accessing the hardware via
> > > shared memory? Or is there software on the BMC which traps these
> > > reads/writes and responds?
> >=20
> > The VUART is virtual because there is no physical UART link between
> > the host and the BMC.
> > Instead, the AST2600 exposes a 16550-compatible register set on both
> > sides (BMC APB and PCIe host MMIO).
> > The data flows using an internal 16 byte FIFO shared between the two
> > register views.
> > So it's hardware emulated and there is no software in the data path.
> >=20
> > The AST2600 has four VUARTs, two of which are accessible via PCIe MMIO.
> > This is based on the following section of the AST2600 datasheet:
> > III.48 VUART and III.64 PCI2VUART.
> >=20
> > Because the silicon presents a standard 16550A interface in hardware,
> > the existing 8250 driver works without modification.
>=20
> So tell us about security.
>=20
> Is only this UART exposed in the shared memory?
>=20

No, however the BMC PCI interface provides a PCI-to-LPC bridge, so PCI
accesses can drive cycles in to e.g LPC IO devices exposed by the BMC.

>  So the memory window
> is 8 bytes wide? Or are there other peripherals also exposed? How do
> we know the aspeed is not using the UART itself?
>=20

For the "regular" SuperIO-controlled UARTs this is a concern, but it's
not a concern for the VUARTs. Each VUART has a pair of 8250 register
sets, one accessible from the BMC, the other accessible to the host,
where both interfaces share the FIFOs to propagate data.

>  If two drivers are
> using it, are we going to crash one or the other system?

By the above, not for the VUARTs.

>=20
> https://en.wikipedia.org/wiki/Core_War
>=20
> The advantage of rpmsg is that the aspeed would advertise what
> services it is willing to expose. The security issues are different,
> implementation bugs vs exposing bits of hardware to an attacker.

From my understanding rpmsg seems like a reasonable fit for the mailbox
functionality.

Andrew

