Return-Path: <linux-aspeed+bounces-2574-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFCBFE730
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Oct 2025 00:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csPQm2r60z306d;
	Thu, 23 Oct 2025 09:46:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761106831;
	cv=none; b=WKRhudu3xz8ExVfdBOCMw9/XxqYdjTZXdfRJ4+xSoBgr58+Nk5QrDSCpsy2HGY++QK7rWyvx2N6+FWSGvgYIGlEV0eF2I5IkhMFjEoPP81macvDiCsWbg+3+3xKPhHD3/q0wTNeIa2V3CKhcCcHl1vMexMW+8R4jPVIz2+eCSQUTHxZ6gXBxUhMyUcL8vKZ00oFMbKv+y+7nsacaUoCQf05rxE/Li5D8tHv4i5GSxOsDWalghGn4pZXHvwimrFGaZMEWaQXzGoKjkez4YUe5mYR9vGF7PBlvMXh/Nf4ZFea5g2kpfSQqIX6E6uwqGeNvlRWlxSI9M4mUBXlbin8L5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761106831; c=relaxed/relaxed;
	bh=ODhNpK7RnCdLY40s70BovQLD/n6xOeEpw27aGxRtg2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1uvWxtyoarucBmtlyQlrlSP2PDRaPT6FFANLXVyjQfGoY2TagUnmpwrSVr4FHfTR/BiXDxwWZ6UFnrUpq8SQpyKVV8LEccnzYjj3ZstH3Mw0l+ZbZY9H11fALUkhg1eTioRNJQrrHG8h2+zvUc7wlMjHeh/Ktp2wG9/UqLcqtA+IyHc+DTXCH5+++0SAJAoXFOlIANtyROeCFweFZbaFrzcbl6RhmIR0C1GM4dQStb9m66V7QCTNGStlKkwRzQckGDC3REwsD+YWDLlm/OQh99p3zqwgUTSWKqxj9w3vBNqVCmhPBVCuuiiKc+s717v30x/Hbb0lmJDDL3i7A3mNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+jFgHaY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+jFgHaY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crwv168R9z2yhX
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Oct 2025 15:20:28 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-88e51cf965dso1261423785a.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Oct 2025 21:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761106825; x=1761711625; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODhNpK7RnCdLY40s70BovQLD/n6xOeEpw27aGxRtg2g=;
        b=D+jFgHaYfYif9h3pwws9UHSoFSQq0go4rMsHgQTdkVp86kPJmQZBtwWJfDNeWBoqVZ
         T674X3Xr8qhmVH0AJlC7tqeXIz/uP/H9rJU1UxNGGWHHJr4zohJEZGHFHptwbj2Ph7sW
         2SiiWsHKnj4MxlvjUpxhoVLfbabFd3ZAHLCIxeenbH/9ErRM9CVIGyrN1+jTQGqSHkse
         MmKJxE4ds6t8D1p0U4erpvgRVq7Dz62QqaekYtMg1OEm9rxEdj0SzACxZPgs7Glt4DbN
         vpUtT2DkzNVhKuSwx4niql51ekIKJcJsCUBuzYxDQXRFwMSBiTVEBJ6hsYlTJQNboyfW
         4YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761106825; x=1761711625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODhNpK7RnCdLY40s70BovQLD/n6xOeEpw27aGxRtg2g=;
        b=VGnzD5uHMYc8BNleXkBu57e6rWSLrEZ2WkUYXWz34dzzCqxoVJfEI+ZvtOOQXb5Oa4
         2n7K7J/zYpr/m3RiJLtOlYWKxiS2mtgSzmihrLVRZ+bT7G3NJP8rLTAm4SQG5896oyOg
         DzZmwL1PbMJ8o0k6avZtVMuqV8Fz5mtVmmCaCErFlaYMbGbpM9O2hoR+Zy1/MaSCgOtt
         jfDQfGSlgRJVebpKJHyHJjtCBGab4Y7wS+sm3okZw9NA93DrrqMNnZE98aEHAlC1ZU5O
         NFaiqgocxBbw+Odobg3APovvrOFSV9mQIKVohCT/Hy9jo1qWRbzmmMfwJnir9eDzKLef
         pQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSJCKPexvNW5RJipJCCEm7HWtRyRnv/DerI2q+yreaf5RuEEYf6+858sireLcwP+9k66upcpF6o6jrMVU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxf4kulytcpfq8trdAxac1K8eF81J4Qj6ELo2+GUYVBqPF60bcG
	IBs/o7tiZAIJ1q89FMIcmxo0KR0rOzUxg8vQ0f/3Sq8/zTR5lkkjZ8VN
X-Gm-Gg: ASbGncsNBP3Ba+11eKAJx9/20beAVgWODyG7RN61lrwnYH1wEo323664HISxWnPwAH6
	8WT5wM9/zbGip/wxQBws9fl8ar91WOY74IggXsWie0mFggrEsgjvE3RUpJTInIqc0K1bc/GeGnN
	76bTh8u2IIL2lhjWFOroFAVV7xOqQM1SBIGyc+kQYR7UkTCSca8AYs1feC12iIckxmr2hu9JPFS
	pMeJqMQbHq54/IKqutGmpC/8K+7ehhql1ovrCAqdaYF1R39fulVPtQsSYIOgT8D3AC/U52c9khM
	aWrEI3xQrPJOiwKLUKjkFNs8T9pdcdHcBRgGm29RLNrj8bCn9fLC7aWZDYCk3fdkyVQqCxbkabD
	N0aez1MH4QtJEAeahyN0IN3Wk9NV2hNhyCNhKEt/UMTPlq+rWvVN9R1yQHkaE3cvQWkCK1+LN
X-Google-Smtp-Source: AGHT+IFKpjZaqHyEdyKVtERVYcIxj+O15A9VpaXXOseaN7ns0Zwp6c8+X3yhxQ/MJYZF6q3dxlGylA==
X-Received: by 2002:a05:620a:170c:b0:891:81e2:fca8 with SMTP id af79cd13be357-89181e2fe2fmr1995019985a.69.1761106824637;
        Tue, 21 Oct 2025 21:20:24 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cfb56807sm902420985a.63.2025.10.21.21.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:20:23 -0700 (PDT)
Date: Wed, 22 Oct 2025 00:20:21 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 2/4] bitfield: Add non-constant field_{prep,get}()
 helpers
Message-ID: <aPhbhQEWAel4aD9t@yury>
References: <cover.1760696560.git.geert+renesas@glider.be>
 <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>
 <aPKQMdyMO-vrb30X@yury>
 <CAMuHMdXq7xubX4a6SZWcC1HX+_TsKeQigDVQrWvA=js5bhaUiQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdXq7xubX4a6SZWcC1HX+_TsKeQigDVQrWvA=js5bhaUiQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 20, 2025 at 03:00:24PM +0200, Geert Uytterhoeven wrote:
> Hi Yury,
> 
> On Fri, 17 Oct 2025 at 20:51, Yury Norov <yury.norov@gmail.com> wrote:
> > On Fri, Oct 17, 2025 at 12:54:10PM +0200, Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> > >
> > > To avoid this limitation, the AT91 clock driver and several other
> > > drivers already have their own non-const field_{prep,get}() macros.
> > > Make them available for general use by consolidating them in
> > > <linux/bitfield.h>, and improve them slightly:
> > >   1. Avoid evaluating macro parameters more than once,
> > >   2. Replace "ffs() - 1" by "__ffs()",
> > >   3. Support 64-bit use on 32-bit architectures.
> > >
> > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > macros, as people expressed the desire to keep stricter variants for
> > > increased safety, or for performance critical paths.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Acked-by: Crt Mori <cmo@melexis.com>
> > > ---
> > > v4:
> > >   - Add Acked-by,
> > >   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
> > >     power management debugfs helper APIs") in v6.17-rc1,
> > >   - Convert more recently introduced upstream copies:
> > >       - drivers/edac/ie31200_edac.c
> > >       - drivers/iio/dac/ad3530r.c
> >
> > Can you split out the part that actually introduces the new API?
> 
> Unfortunately not, as that would cause build warnings/failures due
> to conflicting redefinitions.
> That is a reason why I want to apply this patch ASAP: new copies show
> up all the time.

In a preparation patch, for each driver:

 +#ifndef field_prep
 #define field_prep() ...
 +#endif

Or simply

 +#undef field_prep
 #define field_prep() ...

Then add the generic field_prep() in a separate patch. Then you can drop
ifdefery in the drivers.

Yeah, more patches, but the result is cleaner.

> > > --- a/include/linux/bitfield.h
> > > +++ b/include/linux/bitfield.h
> > > @@ -220,4 +220,40 @@ __MAKE_OP(64)
> > >  #undef __MAKE_OP
> > >  #undef ____MAKE_OP
> > >
> > > +/**
> > > + * field_prep() - prepare a bitfield element
> > > + * @mask: shifted mask defining the field's length and position
> > > + * @val:  value to put in the field
> > > + *
> > > + * field_prep() masks and shifts up the value.  The result should be
> > > + * combined with other fields of the bitfield using logical OR.
> > > + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> > > + */
> > > +#define field_prep(mask, val)                                                \
> > > +     ({                                                              \
> > > +             __auto_type __mask = (mask);                            \
> > > +             typeof(mask) __val = (val);                             \
> > > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > > +                                    __ffs(__mask) : __ffs64(__mask); \
> > > +             (__val << __shift) & __mask;    \
> >
> > __ffs(0) is undef. The corresponding comment in
> > include/asm-generic/bitops/__ffs.h explicitly says: "code should check
> > against 0 first".
> 
> An all zeroes mask is a bug in the code that calls field_{get,prep}().

It's a bug in FIELD_GET() - for sure. Because it's enforced in
__BF_FIELD_CHECK(). field_get() doesn't enforce it, doesn't even
mention that in the comment.

I'm not fully convinced that empty runtime mask should be a bug.
Consider memcpy(dst, src, 0). This is a no-op, but not a bug as
soon as the pointers are valid. If you _think_ it's a bug - please
enforce it.

> > I think mask = 0 is a sign of error here. Can you add a code catching
> > it at compile time, and maybe at runtime too? Something like:
> >
> >  #define __field_prep(mask, val)
> >  ({
> >         unsigned __shift = sizeof(mask) <= 4 ? __ffs(mask) : __ffs64(mask);
> >         (val << __shift) & mask;
> >  })
> >
> >  #define field_prep(mask, val)
> >  ({
> >         unsigned int __shift;
> >         __auto_type __mask = (mask), __ret = 0;
> >         typeof(mask) __val = (val);
> >
> >         BUILD_BUG_ON_ZERO(const_true(mask == 0));
> 
> Futile, as code with a constant mask should use FIELD_PREP() instead.

It's a weak argument. Sometimes compiler is smart enough to realize
that something is a constant, while people won't. Sometimes code gets
refactored. Sometimes people build complex expressions that should
work both in run-time and compile time cases. Sometimes variables are
compile- or run-time depending on config (nr_cpu_ids is an example).

The field_prep() must handle const case just as good as capitalized
version does.
 
> >         if (WARN_ON_ONCE(mask == 0))
> >                 goto out;
> >
> >         __ret = __field_prep(__mask, __val);
> >  out:
> >         ret;
> >  })
> 
> Should we penalize all users (this is a macro, thus inlined everywhere)
> to protect against something that is clearly a bug in the caller?

No. But we can wrap it with a config:

 #ifdef CONFIG_BITFIELD_HARDENING
         if (WARN_ON_ONCE(mask == 0))
                 goto out;
 #endif

The real question here: do you want to help people to catch their bugs,
or you want them to fight it alone?

The _BF_FIELD_CHECK() authors are nice people and provide helpful guides.
(I don't insist, it's up to you.)

> E.g. do_div() does not check for a zero divisor either.
>
> > > +/**
> > > + * field_get() - extract a bitfield element
> > > + * @mask: shifted mask defining the field's length and position
> > > + * @reg:  value of entire bitfield
> > > + *
> > > + * field_get() extracts the field specified by @mask from the
> > > + * bitfield passed in as @reg by masking and shifting it down.
> > > + * Unlike FIELD_GET(), @mask is not limited to a compile-time constant.
> > > + */
> > > +#define field_get(mask, reg)                                         \
> > > +     ({                                                              \
> > > +             __auto_type __mask = (mask);                            \
> > > +             typeof(mask) __reg =  (reg);                            \
> >
> > This would trigger Wconversion warning. Consider
> >         unsigned reg = 0xfff;
> >         field_get(0xf, reg);
> >
> > <source>:6:26: warning: conversion to 'int' from 'unsigned int' may change the sign of the result [-Wsign-conversion]
> >     6 |     typeof(mask) __reg = reg;
> >       |                          ^~~
> >
> > Notice, the __auto_type makes the __mask to be int, while the reg is
> 
> Apparently using typeof(mask) has the same "issue"...
> 
> > unsigned int. You need to do:
> >
> >         typeof(mask) __reg = (typeof(mask))(reg);
> 
> ... so the cast is just hiding the issue? Worse, the cast may prevent the
> compiler from flagging other issues, e.g. when accidentally passing
> a pointer for reg.
 
Ok, makes sense.

> > Please enable higher warning levels for the next round.
> 
> Enabling -Wsign-conversion gives lots of other (false positive?)
> warnings.
> 
> > Also, because for numerals __auto_type is int, when char is enough - are
> > you sure that the macro generates the optimal code? User can workaround it
> > with:
> >
> >         field_get((u8)0xf, reg)
> >
> > but it may not be trivial. Can you add an example and explanation please?
> 
> These new macros are intended for the case where mask is not a constant.
> So typically it is a variable of type u32 or u64.

You never mentioned that. Anyways, it's again a weak argument.
 
> > > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > > +                                    __ffs(__mask) : __ffs64(__mask); \
> >
> > Can you use BITS_PER_TYPE() here?
> 
> Yes, I could use BITS_PER_TYPE(unsigned long) here, to match the
> parameter type of __ffs() (on 64-bit platforms, __ffs() can be used
> unconditionally anyway), at the expense of making the line much longer
> so it has to be split.  Is that worthwhile?
 
Not sure I understand... The

        "unsigned int __shift = BITS_PER_TYPE(mask) < 64 ?"

is 49 chars long vs 42 in your version. Even if you add two tabs, it's
still way below limits. And yes, 

        unsigned int __shift = sizeof(mask) <= 4 ?               \
                                __ffs(__mask) : __ffs64(__mask); \

is worse than

        unsigned int __shift = BITS_PER_TYPE(mask) < 64 ?        \
                                __ffs(__mask) : __ffs64(__mask); \

> > > +             (__reg & __mask) >> __shift;    \
> > > +     })
> > > +
> >
> > When mask == 0, we shouldn't touch 'val' at all. Consider
> >
> >         field_get(0, get_user(ptr))
> >
> > In this case, evaluating 'reg' is an error, similarly to memcpy().
> 
> Again, a zero mask is a bug.
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

