Return-Path: <linux-aspeed+bounces-3838-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIWFDPry0WlYRgcAu9opvQ
	(envelope-from <linux-aspeed+bounces-3838-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sun, 05 Apr 2026 07:28:26 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF339D5A2
	for <lists+linux-aspeed@lfdr.de>; Sun, 05 Apr 2026 07:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fpLb92kFbz2ybQ;
	Sun, 05 Apr 2026 15:28:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775366901;
	cv=none; b=V6rWUrqBC1txK3Np7FbyQZa33AEuaGd6qHZjl9K1PmREAC8JKVGarhmALqR6aslEHsaQ59MlNeUCGh4ZPH1a9RUjwjOc4Nnoqj8wGq9X0/lM0k3AUbSklR33eVyZRQt/UXt523TUZyEb11c77b+xs/4jcUSpJECQQ765FP5LhkNHBUKdfuKZYAeYB/eNv5MZEDsxmnWJjXJo3pDwTlCJjV0UbMprWknO5p80RBdkMOF1av+J7qHOf0fDDm56VCkWUYgl0Wfi0KKrPID+04u29OO+ElyYksF9UGUwJsJyPiRuhk3tCWq0vA7k5U/544VmRVTejUqicmei+BHd/HbNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775366901; c=relaxed/relaxed;
	bh=h2UHsS7SqYYqTozJjfBj6V37VjS+eOmJpA6kFDwrClA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TY0i40R2W60KU/50stMlv+lhQWji3WspWVHOAIcyvZRU4LeOQwgOIZQGUO4Bn3VCgbez9Fm85uvSCVWHKavr5ZYiwpo1eK6xGOyNQIwpr/jKTi6J2zvb6eJ5HuU9G0Sarh+c7J4affovu5kdpC9+Ql3bvbM+mc6w5LJ/RlWmkesOJydfTpdQfvU0yB1yu0W/V2HPUvBaUF1HFdAkH0a738d+j0zfYqI5vOe/uiygPfZg3P4juS29rcoDCYPGgnZkM6CmxpPmLw1fBykzYYf7n1OMrE65adk5+Bv1Njf9pJqK/fe4e7jPteGQvNxoUcS/ZtE86fYf5P2UOn4uyBf13w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bejAtE4V; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bejAtE4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fpLb64p0Gz2ySV;
	Sun, 05 Apr 2026 15:28:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3662A4385A;
	Sun,  5 Apr 2026 05:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B7DC116C6;
	Sun,  5 Apr 2026 05:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775366895;
	bh=ophk+hp6kRAG0U/TAGAhUuOrKmitf0U0PYwWZuudius=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bejAtE4V1Hz3lTSKLlyBcIyR+JNRKDGMc/G8Z0GN4ZPNsCF585rejSzukgcFioxub
	 QUbiyQrTx+RcM6s1+Zu0oaI1vfJoHXTXgrhOUb/YXCMVVE2KZgd+scb35TQsQF7wMb
	 a7Wf9qe7CdkvcplKMPdPqmr9WcFeVQib8uJGDZ1Y=
Date: Sun, 5 Apr 2026 07:27:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Saravana Kannan <saravanak@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>,
	Johan Hovold <johan@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr,
	alexander.stein@ew.tq-group.com, andre.przywara@arm.com,
	andrew@codeconstruct.com.au, andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu,
	ardb@kernel.org, bhelgaas@google.com, brgl@kernel.org,
	broonie@kernel.org, catalin.marinas@arm.com, chleroy@kernel.org,
	davem@davemloft.net, david@kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, driver-core@lists.linux.dev,
	gbatra@linux.ibm.com, gregory.clement@bootlin.com,
	hkallweit1@gmail.com, iommu@lists.linux.dev, jirislaby@kernel.org,
	joel@jms.id.au, joro@8bytes.org, kees@kernel.org,
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org,
	lgirdwood@gmail.com, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-usb@vger.kernel.org, linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com,
	maddy@linux.ibm.com, mani@kernel.org, maz@kernel.org,
	miko.lenczewski@arm.com, mpe@ellerman.id.au, netdev@vger.kernel.org,
	npiggin@gmail.com, osalvador@suse.de, oupton@kernel.org,
	pabeni@redhat.com, palmer@dabbelt.com, peter.ujfalusi@gmail.com,
	peterz@infradead.org, pjw@kernel.org, robh@kernel.org,
	sebastian.hesselbarth@gmail.com, tglx@kernel.org,
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org,
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com,
	yeoreum.yun@arm.com
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
Message-ID: <2026040539-sponge-publisher-2b42@gregkh>
References: <20260404000644.522677-1-dianders@chromium.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404000644.522677-1-dianders@chromium.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [3.79 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-3838-lists,linux-aspeed=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,rowland.harvard.edu,lst.de,google.com,intel.com,ozlabs.ru,arm.com,linux-foundation.org,ziepe.ca,ghiti.fr,ew.tq-group.com,codeconstruct.com.au,lunn.ch,linux.intel.com,eecs.berkeley.edu,davemloft.net,vger.kernel.org,lists.linux.dev,linux.ibm.com,bootlin.com,gmail.com,jms.id.au,8bytes.org,lists.infradead.org,lists.ozlabs.org,kvack.org,armlinux.org.uk,samsung.com,ellerman.id.au,suse.de,redhat.com,dabbelt.com,infradead.org,alpha.franken.de,hisilicon.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_GT_50(0.00)[84];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AAFF339D5A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 05:04:54PM -0700, Douglas Anderson wrote:
> NOTE: one potentially "controversial" choice I made in some patches
> was to always reserve a flag ID even if a flag is only used under
> certain CONFIG_ settings. This is a change from how things were
> before. Keeping the numbering consistent and allowing easy
> compile-testing of both CONFIG settings seemed worth it, especially
> since it won't take up any extra space until we've added a lot more
> flags.

Nah, this is fine, I don't see any problems with this as the original
code kind of was doing the same thing with the "hole" in the structure
if those options were not enabled.

> I only marked the first patch as a "Fix" since it is the only one
> fixing observed problems. Other patches could be considered fixes too
> if folks want.
> 
> I tested the first patch in the series backported to kernel 6.6 on the
> Pixel phone that was experiencing the race. I added extra printouts to
> make sure that the problem was hitting / addressed. The rest of the
> patches are tested with allmodconfig with arm32, arm64, ppc, and
> x86. I boot tested on an arm64 Chromebook running mainline.

I'm guessing your tests passed?  :)

Anyway, this looks great, unless there are any objections, other than
the "needs to be undefined", which a follow-on patch can handle, I'll
queue them up next week for 7.1-rc1.

thanks,

greg k-h

