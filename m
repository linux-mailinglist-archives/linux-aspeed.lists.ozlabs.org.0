Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE96575647
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Jul 2022 22:20:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkQq96fzLz3c5x
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jul 2022 06:20:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.73; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 310 seconds by postgrey-1.36 at boromir; Fri, 15 Jul 2022 06:20:51 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkQq70r5gz3c2n
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jul 2022 06:20:50 +1000 (AEST)
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MuDsZ-1nOvRD1lL3-00udGo; Thu, 14 Jul 2022 22:15:34 +0200
Received: by mail-yb1-f181.google.com with SMTP id n74so5162496yba.3;
        Thu, 14 Jul 2022 13:15:33 -0700 (PDT)
X-Gm-Message-State: AJIora8+QYJieU6LGkeH7hdRLB2g0ZLUXKG9wQcuy/i6sZrqP9v9l0qR
	dkncv4iv0P03/3G099KtYPtNf7J9DoOQv/Ym0cQ=
X-Google-Smtp-Source: AGRyM1ufLR1tXyfyrelM5ysCbbKNSHqOWqFASMdGq5/rYwOY4jOjwUqmCRVpkzIQCCqnubMWRWU8c8ZFrp1nxf+t2A0=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr11089451ybu.134.1657829732313; Thu, 14
 Jul 2022 13:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
 <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com> <YtBazSo/uJzFeF+L@pdel-mbp>
In-Reply-To: <YtBazSo/uJzFeF+L@pdel-mbp>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Jul 2022 22:15:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
Message-ID: <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
To: peter@pjd.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FftOzHHCUW8O8yw1KM7A3ogQUoHgKY1d0z/JuXqtMCEM2s894tn
 trNLC/3XXCktC1vc7aAiv02BGvt92FqyZJ8J6V6VSxhmEMJ3AQIRqFEohNTRWN6Z48sRIxo
 uPh3aSHSsTb4RH426wCJyQVTA4y+CPGanwV47xBwYpESk5gr0TTPSqM/LbXOUSPDkeLhZE6
 r7OTmyRJFdHE27D1r9IVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WRDExTiplpQ=:OxbpIo/dCAE4oK8oZh0gMW
 GRbb7XVoQbYwGqLRfFj7OdQWx1x+vqFfUTmuiIGETKTsdsz/o6BCFgOSAwwk6v2z+OS2xNKzW
 NoaxupOC5tAxSCwnAw84iX4szXpGvvaQWf+Yv7eOtTVOequZJzzs2fpzfQS7eZY3scrgJr5ds
 Kj/uZVeQYPmEciKrmALcWMNhcy8TSZ7+eU+j3kX8MFvh1I2/8iwVfByBOUIVJuR64k+tmP7Cd
 FHQD2Ky01PEnrkGsgfpGT1AYH8+sj/g5c5gXe5rWAYitwUjBulb/vBKSOQ+HyvTQcbM2qY5KY
 WHhai89VGDGtdNYsAatX1wacViD4pgT2MCv1C+DFrYrUXLMd4f3+m64yEfVO+oy7NpY8EL2kU
 EIJHn7HcJaEJ7F5Si5d7tckCZpwfhhxKnz/bkb7zkqzMhUe3toCDkDN7MebRZjYChRqVm+o9N
 Yardt67kxJZ51R19oe6N3fWYO+EaS3foivZdxEwFF5wJaJSSFSH8K9NDrKyW+vvfH4+eFqKoF
 3DLYWoH0I+qURkeuFkPGOpoV1zy/xVkdYrn/LBqGTqgnaDo15pX4SUvqeLLUasHQjP2pg9upk
 nvMBFmDreT7Y1n8zFHDFRlzxRWfImvsBSoYozqfprlij4u3YpMSY1O4uA1f8og+j6k1+7Fflw
 qCak/z2bE9Wh70SCEITDJ7LnzjjvHgwh3YBaxYgEFan8cbVBwOz73gAkvVQ0iNUkcPEINp1o6
 +k0+/wTMPwsOXDWyEu99UeRqf146LQOBlwlg5A==
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Logananth Sundararaj <logananth13.hcl@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, naveen.mosess@hcl.com, thangavel.k@hcl.com, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, garnermic@gmail.com, velumanit@hcl.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 8:05 PM Peter Delevoryas <peter@pjd.dev> wrote:
> On Thu, Jul 07, 2022 at 03:33:48PM +0200, Arnd Bergmann wrote:
> > > +       model = "Facebook fby35";
> > > +       compatible = "facebook,fby35", "aspeed,ast2600";
> > > +
> > > +       aliases {
> > > +               serial4 = &uart5;
> > > +       };
> >
> > Why not start at serial0 here?
>
> Hey, Facebook person jumping in here (using a personal email):
>
> I think you're right, it should be like this:
>
>         aliases {
>                 serial0 = &uart5;
>                 serial1 = &uart1;
>                 serial2 = &uart2;
>                 serial3 = &uart3;
>                 serial4 = &uart4;
>         };

Are you actually using all five uarts though?

> > > +       chosen {
> > > +               stdout-path = &uart5;
> > > +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> > > +       };
>
> Also: if we do serial0 = &uart5, it should be console=ttyS0, not ttyS4.
>
> >
> > The bootargs should really come from the boot loader.
>
> What if we want to boot the kernel by itself with QEMU? It's kinda annoying to
> have to specify '-append "console=ttyS0,57600n8...' everytime, or to have to use
> a wrapper script. But, it's also a source of bugs: I realized yesterday the
> dts we were using here:
>
> https://github.com/facebook/openbmc-linux/blob/e26c76992e0761d9e440ff514538009384c094b4/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
>
> Has the wrong console setting.

You can encode the uart settings like

           stdout-path = "serial0:115200n8"

the rest really should be passed on the command line, not in
the DT shipped with the kernel.

        Arnd
