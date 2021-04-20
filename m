Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B233E3655FE
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Apr 2021 12:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPfly55CDz2ydJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Apr 2021 20:18:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPflw48X7z2xZW
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr 2021 20:18:35 +1000 (AEST)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mtf39-1lmkNU2BJP-00v5j3 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr
 2021 12:18:31 +0200
Received: by mail-wr1-f53.google.com with SMTP id h4so27980137wrt.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Apr 2021 03:18:30 -0700 (PDT)
X-Gm-Message-State: AOAM530Wg0MgGibQWKHX77c+jdJ07fqdtVlJS1lB3Pa3Ud8TWS16nlde
 kV1f4DJ9LrrCjnTjmKWjAZEvNEypDeoqDjqRxJM=
X-Google-Smtp-Source: ABdhPJyUDsDPQ/TzUO8hSAxeXP/7fjRSZkp95zkMD5TB1W8OuX2Qb7o1zHiTDoK9iL0zdA6C2BM7nWmTaVrP5+w7sgI=
X-Received: by 2002:a05:6000:1843:: with SMTP id
 c3mr20452851wri.361.1618913910297; 
 Tue, 20 Apr 2021 03:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
 <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
 <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
In-Reply-To: <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 12:18:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0OJhjF4R1zCm0jD_MUiS8TeDR2x9wTsTC5Apr5Mq_fSg@mail.gmail.com>
Message-ID: <CAK8P3a0OJhjF4R1zCm0jD_MUiS8TeDR2x9wTsTC5Apr5Mq_fSg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1cq1QcDnUCu/trW2kPLxGMd48gTkxDHqCY07CscaDcQj4TQQRVU
 114tysTxaYxEHmr3Ne0yB36DLHdBOoxbshb01vpc6nc8iKnVYvIGfIdITtWeIrLgKOFU33U
 HWZVYWH6YpCUCOLIKyEYmVCjPk/1FfmFtiatg9nD5k6rPvTgOALn93gAcU5YNh9cF7PWE2J
 t3/OrFBoWjF2M4HfZ3LEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G/UbxN2jcbY=:+nzEgQIpVRbg5G/AC1I6y7
 foaRBnX6Pslr+238qgwyVZuBRFw+gVXrr+s+BbOwhUNQ4RsEOYzFhK4Flo9vx/gf3TaMl+qah
 IjRMH/q2LaXmBGiWUOpWsIzk1oQ4PEkduRZBGs11qVT+OZ0e/a94H/M1Erog8BdyYp1ZUDmOR
 UNHOK5LDUx1TYKjCKZQYSc9vOIGTTJtb/mgW50fyIDt/+NLPpRXfMVCRWbVIzp2AwV3wIp44P
 bVpb3T338/grMuJ+1POF3UvrFv/U81cUEXYpj7J4S6X4s91JqWgDNZzVc95+fFeuF0DAsfsF4
 S5wNqeCq4p6NUtrvp+VsXKudjBx/CqCz7QMakkqSbzKe5Ih3hRMLUbKF89jQWCYzT0UQ7cZ2V
 smOyesJN18uunzc7K6+FjpVBPBjwL1ZVTYiXQnqypj4sCdVtHB33aLqTBnztlNC4W3HuBeyaG
 m4oCK5AhiVKtR8N1mbVCZc93AoSwMOkD0pBdbcQmXjOQeimqZKEE2bnI2lhmW57/yZeQ7s3Fj
 BmW7dR0IOSU+shfhzQIFf0=
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
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Apr 20, 2021 at 9:11 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 19 Apr 2021 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > Hello Soc maintainers,
> > >
> > > Here are some fixes for the changes that have already been merged for v5.13.
> > >
> > > I also merged some changes that came in later. If you would prefer to
> > > not take them then I can send a pull with just the fixes.
> > >
> > > The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> > >
> > > for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> >
> > Hi Joel,
> >
> > something about this pull request doesn't add up, and 'b4' refuses
> > to pull it since the 'since commit f0145db2' and 'up to f0145db2'
> > references refer to the same commit.
> >
> > I assume this is just a copy-paste error on your end, but it would
> > be nice if you could double-check and resend the pull request
> > based on the ee33e2fb3d70 commit that I merged.
>
> Nice catch. It looks I've generated pull requests incorrectly from
> v5.5 onwards, and this is the first time we've noticed. My bash
> history shows I started generating them like this:
>
>  git request-pull tag url tag

Ah right. I'm surprised this resulted in the correct shortlog
and diffstat, but that clearly explains it.

> I'll try sending this one again now.

I only started using b4 recently, so I wouldn't have caught it in the past,
as I wasn't paying close attention to the commit hashes. I usually
tried to ensure that the contents match up with the description, and
that worked fine. I've had sporadic problems in the past with b4 and
it's possible that I just papered over it with a manual merge thinking
that I did something wrong instead of b4 pointing out an actual
problem.

      Arnd
