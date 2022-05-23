Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9CC531E92
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 May 2022 00:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6X3x1Cgnz3blK
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 May 2022 08:26:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z7yEJy/N;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z7yEJy/N; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6X3p0RYpz2ynL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 May 2022 08:26:13 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id r23so23276290wrr.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 23 May 2022 15:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ueCq5+dTj6j2yPNYsasO+cBMPLIwNOMj1I6QU8gFRMg=;
 b=Z7yEJy/N2gTlEQbAr5k2NwteV8l9KIjimZtAhoasUEzB9ppgypbhMkY0jGSmdKBT3I
 z2Vlj49NHB7YcTKJmv1M0xCsZoMxHbKqZu4cjWF+24ZoXoRjTb8+j6RiD39XEegUfGA8
 9cY3W9Tdyv3UUwjkXeMpl1eCndMk/AKSldBsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ueCq5+dTj6j2yPNYsasO+cBMPLIwNOMj1I6QU8gFRMg=;
 b=hTaX9zujH0QGJjQH3BTh59We/KdW0iyTpAgmSPTU3vDceqHHm9sZOff7tT9D5iw9Lv
 8xWt3NGEkkq1tccgyG9IIDjGHMu5ZX9pMskAMAwH5KaQ27jv4ju6oCHf18pYuvKC3v6x
 2nkx1orkpasJG2SHXiyKtq0dbhuGAZel0Mcyv0kOxqWwNPU51+e3hq49urvKtVKiCJnk
 ToxDteou/ja7n3tpNo2oLBvw71jn8ThOOTY561Mg4IO42U9HAUL5bDExTnA9xa4e4Qdf
 1ldKADggEwCqte6yqnzUBzSkLZsJDlydZUzxhKNELbd6iB/1leZPrGPwomJfNjXKZJMa
 bCtg==
X-Gm-Message-State: AOAM530GrvbjjVrsqcG8XNZegKB7cd2YxhfVhB318pEpaJUDq9HwSxjA
 FjqlHQfg6CXaC1kYkTBrOvbX4O/xbGXZX0eJUvU=
X-Google-Smtp-Source: ABdhPJzXPWHSihtrD6rjhJLffk6Kg48cDC7kXb+c+GvCBO+Gaz2Ij5Q+JUiK+Kcp4D36G0x093aCzEiTrPrYohUjiM8=
X-Received: by 2002:adf:e18f:0:b0:20e:6352:211d with SMTP id
 az15-20020adfe18f000000b0020e6352211dmr20641190wrb.606.1653344765206; Mon, 23
 May 2022 15:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220517092217.323060-1-joel@jms.id.au>
 <5630dd68ca5f31dafce3f92489761294ea589b16.camel@kernel.crashing.org>
In-Reply-To: <5630dd68ca5f31dafce3f92489761294ea589b16.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 May 2022 22:25:52 +0000
Message-ID: <CACPK8Xd5BLiz1ePwzirtxLvSL8V8EGmJuxB0GmxyyqBRK9mSdQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: ftgmac100: Disable hardware checksum on
 AST2600
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>, David Wilder <wilder@us.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 21 May 2022 at 02:53, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Tue, 2022-05-17 at 18:52 +0930, Joel Stanley wrote:
> > The AST2600 when using the i210 NIC over NC-SI has been observed to
> > produce incorrect checksum results with specific MTU values. This was
> > first observed when sending data across a long distance set of
> > networks.
> >
> > On a local network, the following test was performed using a 1MB file
> > of random data.
>
> Can you double check with Aspeed what's going on there and whether
> there's a way to instead, identify the bad case in the TX path and do
> on-demand SW checksuming only in those cases ?

Keep in mind this is only for the NC-SI case, where the link is
limited to 100Mbit anyway.

I did some tests with the openbmc kernel; a v5.15 tree with whatever
options we have enabled there.

Averaging a few iperf3 runs I see about 92Mbit/s with hardware
checksumming enabled, and 90Mbit/s with it disabled. So we can see the
difference, and it would be good if Aspeed could find the root cause
so this only needs to be disabled when hitting the problematic path as
you say.

> Because disabling HW checksum will kill performances afaik... (doesn't
> it also end up disabling zero-copy and SG ?)

Not sure?

>
> Cheers,
> Ben.
>
> > On the receiver run this script:
> >
> >  #!/bin/bash
> >  while [ 1 ]; do
> >         # Zero the stats
> >         nstat -r  > /dev/null
> >         nc -l 9899 > test-file
> >         # Check for checksum errors
> >         TcpInCsumErrors=$(nstat | grep TcpInCsumErrors)
> >         if [ -z "$TcpInCsumErrors" ]; then
> >                 echo No TcpInCsumErrors
> >         else
> >                 echo TcpInCsumErrors = $TcpInCsumErrors
> >         fi
> >  done
> >
> > On an AST2600 system:
> >
> >  # nc <IP of  receiver host> 9899 < test-file
> >
> > The test was repeated with various MTU values:
> >
> >  # ip link set mtu 1410 dev eth0
> >
> > The observed results:
> >
> >  1500 - good
> >  1434 - bad
> >  1400 - good
> >  1410 - bad
> >  1420 - good
> >
> > The test was repeated after disabling tx checksumming:
> >
> >  # ethtool -K eth0 tx-checksumming off
> >
> > And all MTU values tested resulted in transfers without error.
> >
> > An issue with the driver cannot be ruled out, however there has been
> > no
> > bug discovered so far.
> >
> > David has done the work to take the original bug report of slow data
> > transfer between long distance connections and triaged it down to
> > this
> > test case.
> >
> > The vendor suspects this this is a hardware issue when using NC-SI.
> > The
> > fixes line refers to the patch that introduced AST2600 support.
> >
> > Reported-by: David Wilder <wilder@us.ibm.com>
> > Reviewed-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > v3 modifies the wrapping of the commit message.
> >
> > v2 updates the commit message with confirmation from the vendor that
> > this is a hardware issue, and clarifies why the commit used in the
> > fixes
> >
> >  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > b/drivers/net/ethernet/faraday/ftgmac100.c
> > index caf48023f8ea..5231818943c6 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -1928,6 +1928,11 @@ static int ftgmac100_probe(struct
> > platform_device *pdev)
> >       /* AST2400  doesn't have working HW checksum generation */
> >       if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
> >               netdev->hw_features &= ~NETIF_F_HW_CSUM;
> > +
> > +     /* AST2600 tx checksum with NCSI is broken */
> > +     if (priv->use_ncsi && of_device_is_compatible(np,
> > "aspeed,ast2600-mac"))
> > +             netdev->hw_features &= ~NETIF_F_HW_CSUM;
> > +
> >       if (np && of_get_property(np, "no-hw-checksum", NULL))
> >               netdev->hw_features &= ~(NETIF_F_HW_CSUM |
> > NETIF_F_RXCSUM);
> >       netdev->features |= netdev->hw_features;
>
