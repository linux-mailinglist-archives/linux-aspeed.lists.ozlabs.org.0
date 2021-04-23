Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA53690AF
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 12:57:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRWT003yCz2yxS
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 20:57:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRWSx2SXjz2yQm
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Apr 2021 20:57:04 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-45-edUjWyPgOc6IiAfhYVLPBQ-1; Fri, 23 Apr 2021 11:55:01 +0100
X-MC-Unique: edUjWyPgOc6IiAfhYVLPBQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 23 Apr 2021 11:54:59 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Fri, 23 Apr 2021 11:54:59 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sergey Organov' <sorganov@gmail.com>
Subject: RE: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Topic: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Thread-Index: AQHXOC3N+IlNNgnl7EGootyN/jCOrarB7AEQ
Date: Fri, 23 Apr 2021 10:54:59 +0000
Message-ID: <265e2d3accc74c89b5bab22eadb43808@AcuMS.aculab.com>
References: <YIE90PSXsMTa2Y8n@mwanda>
 <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
 <877dktuvmz.fsf@osv.gnss.ru>
In-Reply-To: <877dktuvmz.fsf@osv.gnss.ru>
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
> Sent: 23 April 2021 11:46
>=20
> David Laight <David.Laight@ACULAB.COM> writes:
>=20
> > From: Dan Carpenter
> >> Sent: 22 April 2021 10:12
> >>
> >> The intent here was to return negative error codes but it actually
> >> returns positive values.  The problem is that type promotion with
> >> ternary operations is quite complicated.
> >>
> >> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() functi=
on
> >> returns long.  What happens is that "ret" is cast to u32 and becomes
> >> positive then it's cast to long and it's still positive.
> >>
> >> Fix this by removing the ternary so that "ret" is type promoted direct=
ly
> >> to long.
> >>
> >> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc=
 chardev")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> ---
> >>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspee=
d/aspeed-lpc-snoop.c
> >> index 210455efb321..eceeaf8dfbeb 100644
> >> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> >> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> >> @@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, c=
har __user *buffer,
> >>  =09=09=09return -EINTR;
> >>  =09}
> >>  =09ret =3D kfifo_to_user(&chan->fifo, buffer, count, &copied);
> >> +=09if (ret)
> >> +=09=09return ret;
> >>
> >> -=09return ret ? ret : copied;
> >> +=09return copied;
> >
> > I wonder if changing it to:
> > =09return ret ? ret + 0L : copied;
> >
> > Might make people think in the future and not convert it back
> > as an 'optimisation'.
>=20
> It rather made me think: "what the heck is going on here?!"
>=20
> Shouldn't it better be:
>=20
>  =09return ret ? ret : (long)copied;
>=20
> or even:
>=20
>         return ret ?: (long)copied;

Or change the return type to int ?

The problem is that ?: doesn't behave the way most people expect.
The two possible values have to be converted to the same type.

Together with the broken decision of the original ANSI C committee
to change from K&R's 'sign preserving' to 'value preserving'
integer promotions causes grief here and elsewhere.
(Not no mention breaking existing code!)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

