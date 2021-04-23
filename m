Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A635F36952F
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 16:55:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRcmF2hDmz2yxP
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Apr 2021 00:55:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRcmB6h0vz2xfh
 for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Apr 2021 00:55:37 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-36-dOwhnU8nPbOR9TIB42nwTg-1; Fri, 23 Apr 2021 15:55:31 +0100
X-MC-Unique: dOwhnU8nPbOR9TIB42nwTg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 23 Apr 2021 15:55:30 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Fri, 23 Apr 2021 15:55:29 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sergey Organov' <sorganov@gmail.com>, Walter Harms <wharms@bfs.de>
Subject: RE: AW: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Topic: AW: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Index: AQHXOE6YUD1kHD3sxkSNy+8EQaJbFarCLf3Q
Date: Fri, 23 Apr 2021 14:55:29 +0000
Message-ID: <635275613c384fe381df4ae4ac30f380@AcuMS.aculab.com>
References: <YIE90PSXsMTa2Y8n@mwanda>
 <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
 <877dktuvmz.fsf@osv.gnss.ru>
 <265e2d3accc74c89b5bab22eadb43808@AcuMS.aculab.com>
 <ebe4a1a6dd0748e28e6ca19aec20223e@bfs.de> <878s59rrn0.fsf@osv.gnss.ru>
In-Reply-To: <878s59rrn0.fsf@osv.gnss.ru>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Robert Lippert <rlippert@google.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 'Dan Carpenter' <dan.carpenter@oracle.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Sergey Organov
> Sent: 23 April 2021 15:40
>=20
> Walter Harms <wharms@bfs.de> writes:
>=20
> > as indepentent observer,
> > i would go for Dans solution:
> >
> > ret =3D kfifo_to_user();
> > /* if an error occurs just return */
> > if (ret)
> >    return ret;
> >
> > /* otherwise return the copied number of bytes */
> >
> > return copied;
> >
> > there is no need for any deeper language knowledge,
>=20
> Yep, but this is not idiomatic C, so one looking at this code would
> tend to convert it back to ternary, and the actual problem here is that
> the type of 'copied' does not match the return type of the function.

Actually changing the type of 'ret' to ssize_t is probably
the safest change.

That works until someone tries to optimise out 'ret' by doing:

=09return kfifo_to_user(...) ?: count;

Or rattle through and remove the 'pass by reference' 'count'
parameter from kfifo_to_user() in favour of returning the
value the callers want.

I need to stop looking at this code :-)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

