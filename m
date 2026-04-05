Return-Path: <linux-aspeed+bounces-3839-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI4XAUbn0mmFcAcAu9opvQ
	(envelope-from <linux-aspeed+bounces-3839-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 06 Apr 2026 00:50:46 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE43A00BA
	for <lists+linux-aspeed@lfdr.de>; Mon, 06 Apr 2026 00:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fpnjm6wPcz2xPL;
	Mon, 06 Apr 2026 08:50:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775429436;
	cv=none; b=Lk6AzfFnNf34u60E0dSlP5U2fbxvCyUQ9u6ts4aAvf41yIL4lozZS06kmEI9y6YqMFB8/4O2v7HbATPxmIF9Ei08DOU6hMXyv/pHEG4AuZZQPwArKVrdlLtgXyNTF5hdXWulVxG32RIL8GGoHja8PSmFMHO6/fKrvwbDXP+cOGfjtH5h9kLHZ+s+6GGqI741SWlEXI93m1mKkziBfRIj5gj+/Xtr4bDC4sfp8eG/AFfz6nktijOz85w3I49Xa6PoOXRn+Mpgc0GF7E8Eq0ZZmpi/8ydYiTsYkeN3yIyrkH2VQWYckc9REmxVKVBI4lUXlzL2F1nW6YA/LNFu7xVyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775429436; c=relaxed/relaxed;
	bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlHR9O3GS3FdQBcBPT1O8GgG8bl2mIXLBcJKdCYSTmG34bvuyGZpy+5si19zqcN1koRetqYpIkWXZBkvc8j9mMZfwTuUKjFF53nOm+DciM55PdLy9QDYP82f8IOUAzZ4W5eK4ubcLCciIv6Rg/RvHDjVOQDDS7Qg59T8ZlXlvLs4QOEdgLSqpw9+5mseU/5bVn2rJld/3oEj8Be1o8//OAJFLF49V6DpoJgthox4XleydpyLZGYO78L6WYCcbjNNy/KpMRaJPvuHqbLzd6AF7JeeAFHMCN9SXG6PVSaYxEWWkadewuSbkOfj2hKah0+wm5+9z1Tsamf6xXUlt+w2pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HHt55Ggu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HHt55Ggu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fpnjl2v0Zz2xMY
	for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Apr 2026 08:50:34 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so544435366b.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 05 Apr 2026 15:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775429429; x=1776034229; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=HHt55Gguc/wileELQGXmaDniiMJf1USn9kB8KbCdzDDaKywtr7FzdmtVmTbAaqTeNB
         To3F8jlpF7cbJM/EWU7kE3CxDZAxK44rvOHBu/bVnBGsZQbOE/ZwWmg5rM9PxBy1uugT
         KUeohzpovUUE3BzAWvdnVNrB0HbEOzwFN6E8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775429429; x=1776034229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=fACtfVFUbOVHfZxWNyL391rHPJfpvF0tv2Iu8+soDpyRnxq0z2Bphysw2/n7USH5zO
         73K71M9My7KoEHBsf3u+Em9yqRu+xQF0lMJWXEpPXJCAjPqTc7wt1ohaJ03S8by15YPX
         gM2Wag9enK2mxbnOCDW0CjW6wEQnC7QsVb1QnD0dbxLZ/cZb5wV1xNUaqyLoLqL0UuDY
         /xrkZ3+hQABw1srSYQBl6pRnLhl7WDYlNTP3kuse7LVZeeHEp3cOCZmLDxkyJqAgtMgd
         UY9YIMTSBxjId7IJsAk28oektAau5XvYmPurB8P+lUj/g6qUFtpRRaxaivJmjgzMPTlH
         I2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSMbzEfsWObYM6PMo1HMUf2Mb7BnqOpSDDqwESWi14zdZFyW2FCNH90nvhfWsJHL/5eijwyzQy2WvPdjU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwX3O27a8lswS7/W/3DVSza9jb5UpOMfaucUAtTHt9UVbtACVzn
	29roAIzH7lJE98qtN5mRkBRiJz+ZQxrHaWbmm+LOgYvv8gik6lmVRZkTfvWf8Ym8kt4vcj83nAd
	G6yMBAM9B
X-Gm-Gg: AeBDies715aB3dnQjbaXeEHSNpnd8l0tt+vsM3a+JAMvD6bg1H85rPH2PvQb/9/ZJpw
	2XsfKuiNTi1PrY//UUgXewir0RNQFm10osNTZdIjC6kS3GCDOD7ZzCFLViBE1zLfy8mL+ijOxM5
	kSanOuaexXgjHvJ+bttLaUJSpooyuyF7/AyPQLPnbM65m8rvJJupNPsOv8CP7hpsaIgSxxgqf/0
	dKERiYoxTx5mJjPxryR22u9Ij4mauCTvknBsbIRpOqdsA1iVBqOM1H7LC4AgqrSBdx1tbTy4KRN
	RtrHmxsQNiEeopEpgWAqbprcAMCqbPx3NDgf1bpH6PhHUj7NSmJGGYeBOehSNE9blnJTCllbiDS
	kRZwWhfZphZeb/V58UxiVjAUQouW+XbfP3LvgB1xfIyXA9qU3y5TEU2yy4au3jDanwPFORbrjW0
	xqAVhV2MbmSa5uuo8GgA3lNAk3GGWo6Rzvnl6N66JOcX+0gWVCu1uO9DsiiVMqIg==
X-Received: by 2002:a17:907:15d1:b0:b98:3fdc:150e with SMTP id a640c23a62f3a-b9c6742fea3mr435198666b.2.1775429429195;
        Sun, 05 Apr 2026 15:50:29 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9974dsm421176966b.23.2026.04.05.15.50.29
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:50:29 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66ee0241bc4so774536a12.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 05 Apr 2026 15:50:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKAY7n84+alH2tuFQRFERNOIQs0y73ZTm0lbNABnOkE1YKRv3ujfC41/KN8IhTvFzi2KvLs7Q71xGPdWM=@lists.ozlabs.org
X-Received: by 2002:a5d:5889:0:b0:43b:47ee:4586 with SMTP id
 ffacd0b85a97d-43d292d34e1mr14051064f8f.29.1775429026066; Sun, 05 Apr 2026
 15:43:46 -0700 (PDT)
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
References: <20260404000644.522677-1-dianders@chromium.org> <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 5 Apr 2026 15:43:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
X-Gm-Features: AQROBzBHjVedWun0AWH98b5RajBbraAAaRvLQSenEhaNEY8p1Czch8mAczvPiQQ
Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, Johan Hovold <johan@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr, alexander.stein@ew.tq-group.com, 
	andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch, 
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, broonie@kernel.org, 
	catalin.marinas@arm.com, chleroy@kernel.org, davem@davemloft.net, 
	david@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	driver-core@lists.linux.dev, gbatra@linux.ibm.com, 
	gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev, 
	jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org, 
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux@armlinux.org.uk, 
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com, maddy@linux.ibm.com, 
	mani@kernel.org, maz@kernel.org, miko.lenczewski@arm.com, mpe@ellerman.id.au, 
	netdev@vger.kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	oupton@kernel.org, pabeni@redhat.com, palmer@dabbelt.com, 
	peter.ujfalusi@gmail.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sebastian.hesselbarth@gmail.com, tglx@kernel.org, 
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yeoreum.yun@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3839-lists,linux-aspeed=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,rowland.harvard.edu,lst.de,google.com,intel.com,ozlabs.ru,arm.com,linux-foundation.org,ziepe.ca,ghiti.fr,ew.tq-group.com,codeconstruct.com.au,lunn.ch,linux.intel.com,eecs.berkeley.edu,davemloft.net,vger.kernel.org,lists.linux.dev,linux.ibm.com,bootlin.com,gmail.com,jms.id.au,8bytes.org,lists.infradead.org,lists.ozlabs.org,kvack.org,armlinux.org.uk,samsung.com,ellerman.id.au,suse.de,redhat.com,dabbelt.com,infradead.org,alpha.franken.de,hisilicon.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:stern@rowland.harvard.edu,m:saravanak@kernel.org,m:hch@lst.de,m:edumazet@google.com,m:johan@kernel.org,m:leon@kernel.org,m:aleksander.lobakin@intel.com,m:aik@ozlabs.ru,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:Frank.Li@kernel.org,m:jgg@ziepe.ca,m:alex@ghiti.fr,m:alexander.stein@ew.tq-group.com,m:andre.przywara@arm.com,m:andrew@codeconstruct.com.au,m:andrew@lunn.ch,m:andriy.shevchenko@linux.intel.com,m:aou@eecs.berkeley.edu,m:ardb@kernel.org,m:bhelgaas@google.com,m:brgl@kernel.org,m:broonie@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:david@kernel.org,m:devicetree@vger.kernel.org,m:dmaengine@vger.kernel.org,m:driver-core@lists.linux.dev,m:gbatra@linux.ibm.com,m:gregory.clement@bootlin.com,m:hkallweit1@gmail.com,m:iommu@lists.linux.dev,m:jirislaby@kernel.org,m:joel@jms.id.au,m:joro@8bytes.org,m:kees@kernel.org,m:kevin.brodsky@arm.com,m:kuba@kerne
 l.org,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linux-acpi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-cxl@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-serial@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-usb@vger.kernel.org,m:linux@armlinux.org.uk,m:linuxppc-dev@lists.ozlabs.org,m:m.szyprowski@samsung.com,m:maddy@linux.ibm.com,m:mani@kernel.org,m:maz@kernel.org,m:miko.lenczewski@arm.com,m:mpe@ellerman.id.au,m:netdev@vger.kernel.org,m:npiggin@gmail.com,m:osalvador@suse.de,m:oupton@kernel.org,m:pabeni@redhat.com,m:palmer@dabbelt.com,m:peter.ujfalusi@gmail.com,m:peterz@infradead.org,m:pjw@kernel.org,m:robh@kernel.org,m:sebastian.hesselbarth@gmail.com,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:vgupta@kernel.org,m:vkoul@kernel.org,m:will@kernel.org,m:willy@infradead.org,m:yangyicong@hisilicon.com,
 m:yeoreum.yun@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Queue-Id: 85DE43A00BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Sat, Apr 4, 2026 at 10:28=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 03, 2026 at 05:04:54PM -0700, Douglas Anderson wrote:
> > NOTE: one potentially "controversial" choice I made in some patches
> > was to always reserve a flag ID even if a flag is only used under
> > certain CONFIG_ settings. This is a change from how things were
> > before. Keeping the numbering consistent and allowing easy
> > compile-testing of both CONFIG settings seemed worth it, especially
> > since it won't take up any extra space until we've added a lot more
> > flags.
>
> Nah, this is fine, I don't see any problems with this as the original
> code kind of was doing the same thing with the "hole" in the structure
> if those options were not enabled.
>
> > I only marked the first patch as a "Fix" since it is the only one
> > fixing observed problems. Other patches could be considered fixes too
> > if folks want.
> >
> > I tested the first patch in the series backported to kernel 6.6 on the
> > Pixel phone that was experiencing the race. I added extra printouts to
> > make sure that the problem was hitting / addressed. The rest of the
> > patches are tested with allmodconfig with arm32, arm64, ppc, and
> > x86. I boot tested on an arm64 Chromebook running mainline.
>
> I'm guessing your tests passed?  :)

Yup, all the tests that I've run have passed. I also threw in an
"allnoconfig" compile test just for good measure.


> Anyway, this looks great, unless there are any objections, other than
> the "needs to be undefined", which a follow-on patch can handle, I'll
> queue them up next week for 7.1-rc1.

Thanks. As per the other thread, I'm happy if you or Danilo want to
apply it, and I'm happy if you want to make minor fixups when
applying.

When I see the patches applied, I'll send a followup patch to address
the "needs to be undefined" comment, unless Danilo makes that change
himself when applying.

-Doug

