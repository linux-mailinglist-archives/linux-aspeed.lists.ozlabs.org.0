Return-Path: <linux-aspeed+bounces-3855-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W6R5FkKQ1Wl87gcAu9opvQ
	(envelope-from <linux-aspeed+bounces-3855-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 01:16:18 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373B3B56CB
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 01:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fr2BQ42jpz2yZ6;
	Wed, 08 Apr 2026 09:16:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775602731;
	cv=none; b=KceDmhLVn0LiutejVZA0Q43kOv754+Z+mUQBQezdjwg0b7rH0csahqWHRSAoijxRISkHRWcwKpYvDjtWyz4fIH1AJntx+KznHmBl2fj8LEsxdfbkEQPIaD+9z5RY2OalThjNKgCd7xRFQt1QJSulEfNYEZ/0p89CT2WbZcR9lEaQszWfK7eMgAATBwKLngRL4isuDtJMdDwuwrv2XHrlY7efAQL16ewIvgwpivVXrMCnkJXIkQWx+A3ZvD2gjlZBgS567V0hV4yYWi4n7r+Fiz0kw/kC3N/oVSnBt9y9ZPx3TU8lqWhVI5c5qSuzN8c3c6ZkGuJSZKte1RbqSzq92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775602731; c=relaxed/relaxed;
	bh=WMbYOgaDr/Kx+71TeWTaVBU+sUYdKg1v+oxDqlB4JDE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=OZCNau/W+3jjmpAqljEqbE+oDYmThqrNuC/JNeNN1Oq8j0gwa9uJ7rz+Vf92bajt3P5FMdd6HvTmQXkkuLOlhGkyvxvcqF6pceQMAxpZyGHG+h5fPHzTGsXwQFUcZUzhvUY+TvY3zRULxySn5+x29Q0BpkUxETPWW4/d9vIEWcYqF9fxJX32Hu3g8DUFChrBJBU5HkQMA0Ba1w4TLEoQvanBVjC1RsOf0lUBv0/87MTKGHuV5mYWrT/BWwiNG6aTckntesd138Fiq3LPHVTXSiDh70EQgYB+nYM0sVso2jeC55wKFlzMb4IRIwpNcTsdVwE0fOgRc8brqsmCkLp16Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YxT4H0gM; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YxT4H0gM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fr1pL5NCPz2xSB;
	Wed, 08 Apr 2026 08:58:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4480660128;
	Tue,  7 Apr 2026 22:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C69C116C6;
	Tue,  7 Apr 2026 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775602726;
	bh=ZxMhQkn/NMJTsfUq+eNI5wRqTDBwCQBg1cjTyGaGSzA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YxT4H0gMU1uiOeHwbtOxxGkfFWJBaCzthqg03Sftf8l9d186Y09INkfJ8VCpcsjUT
	 Qfd/Qlw+XjxQGpsD/+wtJtFtyh3etr3/mtV9qhSmixByvSXfzBB7nBSEJNPsodmdHd
	 n6aWnXLqcu6DDQCkFID7N0ab2dedIpF0ftmNXCcvehsYTzafVVvpTSGtJI0Yt78qAh
	 7zcrBzbK4e2mGEgKbxfT4/RQOcj3aPhgKqv9IwN+ABisbMsvBq2hQAvVVGI9l26vIJ
	 NOji8KIk0pikMh4DCWmZrmRQsTJnp7fjTB24k9B9hx+3b4Laf7gnEUw1IEsuOG28xo
	 +wM+h43SmOleg==
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 00:58:28 +0200
Message-Id: <DHNAMNISZJ9O.3B58NWX64GBGE@kernel.org>
Subject: Re: [PATCH v5 0/9] driver core: Fix some race conditions
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Alexey
 Kardashevskiy" <aik@ozlabs.ru>, "Johan Hovold" <johan@kernel.org>, "Eric
 Dumazet" <edumazet@google.com>, "Leon Romanovsky" <leon@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>, <maz@kernel.org>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Saravana Kannan" <saravanak@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, <Frank.Li@kernel.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, <alex@ghiti.fr>,
 <alexander.stein@ew.tq-group.com>, <andre.przywara@arm.com>,
 <andrew@codeconstruct.com.au>, <andrew@lunn.ch>,
 <andriy.shevchenko@linux.intel.com>, <aou@eecs.berkeley.edu>,
 <ardb@kernel.org>, <astewart@tektelic.com>, <bhelgaas@google.com>,
 <brgl@kernel.org>, <broonie@kernel.org>, <catalin.marinas@arm.com>,
 <chleroy@kernel.org>, <davem@davemloft.net>, <david@kernel.org>,
 <devicetree@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <gbatra@linux.ibm.com>,
 <gregory.clement@bootlin.com>, <hkallweit1@gmail.com>,
 <iommu@lists.linux.dev>, <jirislaby@kernel.org>, <joel@jms.id.au>,
 <joro@8bytes.org>, <kees@kernel.org>, <kevin.brodsky@arm.com>,
 <kuba@kernel.org>, <lenb@kernel.org>, <lgirdwood@gmail.com>,
 <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-cxl@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pci@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-snps-arc@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux@armlinux.org.uk>, <linuxppc-dev@lists.ozlabs.org>,
 <maddy@linux.ibm.com>, <mani@kernel.org>, <miko.lenczewski@arm.com>,
 <mpe@ellerman.id.au>, <netdev@vger.kernel.org>, <npiggin@gmail.com>,
 <osalvador@suse.de>, <oupton@kernel.org>, <pabeni@redhat.com>,
 <palmer@dabbelt.com>, <peter.ujfalusi@gmail.com>, <peterz@infradead.org>,
 <pjw@kernel.org>, <robh@kernel.org>, <sebastian.hesselbarth@gmail.com>,
 <tglx@kernel.org>, <tsbogend@alpha.franken.de>, <vgupta@kernel.org>,
 <vkoul@kernel.org>, <will@kernel.org>, <willy@infradead.org>,
 <yangyicong@hisilicon.com>, <yeoreum.yun@arm.com>
To: "Douglas Anderson" <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260406232444.3117516-1-dianders@chromium.org>
In-Reply-To: <20260406232444.3117516-1-dianders@chromium.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3855-lists,linux-aspeed=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,rowland.harvard.edu,ozlabs.ru,google.com,lst.de,intel.com,linux-foundation.org,ziepe.ca,ghiti.fr,ew.tq-group.com,arm.com,codeconstruct.com.au,lunn.ch,linux.intel.com,eecs.berkeley.edu,tektelic.com,davemloft.net,vger.kernel.org,lists.linux.dev,linux.ibm.com,bootlin.com,gmail.com,jms.id.au,8bytes.org,lists.infradead.org,lists.ozlabs.org,kvack.org,armlinux.org.uk,ellerman.id.au,suse.de,redhat.com,dabbelt.com,infradead.org,alpha.franken.de,hisilicon.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[85];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3373B3B56CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Apr 7, 2026 at 1:22 AM CEST, Douglas Anderson wrote:

Applied to driver-core-testing, thanks!

> Douglas Anderson (9):
>   driver core: Don't let a device probe until it's ready
>   driver core: Replace dev->can_match with dev_can_match()
>   driver core: Replace dev->dma_iommu with dev_dma_iommu()
>   driver core: Replace dev->dma_skip_sync with dev_dma_skip_sync()
>   driver core: Replace dev->dma_ops_bypass with dev_dma_ops_bypass()
>   driver core: Replace dev->state_synced with dev_state_synced()
>   driver core: Replace dev->dma_coherent with dev_dma_coherent()

    [ Since all DEV_FLAG_DMA_COHERENT accessors are exposed unconditionally=
,
      also drop the CONFIG guards around dev_assign_dma_coherent() in
      device_initialize() to ensure a correct default value. - Danilo ]

>   driver core: Replace dev->of_node_reused with dev_of_node_reused()
>   driver core: Replace dev->offline + ->offline_disabled with accessors

