Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FA369622
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 17:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRdR54w5gz2yxW
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Apr 2021 01:25:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=Oc/rDr5q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=Oc/rDr5q; 
 dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRdR34Z85z2xYY
 for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Apr 2021 01:25:50 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NFG0kM005206; Fri, 23 Apr 2021 15:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=pbVVKuyQK5q5hcI5v7ncsGBjn84Ca1cs5D6tvGmMKec=;
 b=Oc/rDr5qh9qz5jB47ktLNEj9/5BLNwf1kAqA/ic9XZ8wfJknOxMhUXeV2yB+K98uTKFD
 cXVVJQb7TGclTwRgn0uIhaARpz6sfewc4Eg09iej6BjwrQUZDpUEqK2MmvbY4uZ+L1+m
 uDfsN4F0vQKEnh3BFKGTpPvvEKWvdK93ryQATl/okK5GxmxePP88B0HQ1XBIB19SjJVb
 MeYNiwHodPz/85vJfDssd0Em3ABOGBnA1xl7hpt+eCPuKf/9Sek1EomD90p7EAT6nKzk
 AeZQonaeduVZQUgwK4AyU2MMHgII1FN4fgQJFHegZuHmiJEY+MQqplsfMyZHSxWaVXjq Bg== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 383j5s895t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 15:25:24 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13NFK2L2114865;
 Fri, 23 Apr 2021 15:25:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 383cgaf70y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 15:25:23 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13NFP2Di131894;
 Fri, 23 Apr 2021 15:25:22 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 383cgaf70k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 15:25:22 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13NFPAIL009081;
 Fri, 23 Apr 2021 15:25:10 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 23 Apr 2021 08:25:10 -0700
Date: Fri, 23 Apr 2021 18:24:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sergey Organov <sorganov@gmail.com>
Subject: Re: AW: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Message-ID: <20210423152459.GU1959@kadam>
References: <YIE90PSXsMTa2Y8n@mwanda>
 <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
 <877dktuvmz.fsf@osv.gnss.ru>
 <265e2d3accc74c89b5bab22eadb43808@AcuMS.aculab.com>
 <ebe4a1a6dd0748e28e6ca19aec20223e@bfs.de>
 <878s59rrn0.fsf@osv.gnss.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878s59rrn0.fsf@osv.gnss.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: PN18IsdkXlnRXsRsGcqbP1RqHBC8pUjr
X-Proofpoint-GUID: PN18IsdkXlnRXsRsGcqbP1RqHBC8pUjr
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
 David Laight <David.Laight@ACULAB.COM>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Walter Harms <wharms@bfs.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 05:40:19PM +0300, Sergey Organov wrote:
> Walter Harms <wharms@bfs.de> writes:
> 
> > as indepentent observer,
> > i would go for Dans solution:
> >
> > ret = kfifo_to_user();
> > /* if an error occurs just return */
> > if (ret)
> >    return ret;
> >
> > /* otherwise return the copied number of bytes */
> >
> > return copied;
> >
> > there is no need for any deeper language knowledge,
> 
> Yep, but this is not idiomatic C, so one looking at this code would
> tend to convert it back to ternary, and the actual problem here is that
> the type of 'copied' does not match the return type of the function.
>

I help maintain drivers/staging.  I would hope that no one would send us
a patch like this because it's not a checkpatch or CodingStyle violation.
But people have sent us these before and Greg NAKs them because he
doesn't like ternaries.  I NAK them because I like my success path kept
separate from the failure path.  I want the success path indented one
tab and the failure path indented two tabs.  I like when code is written
ploddingly, without fanciness, or combining multiple things on one line.

Using a ternary in this context seems to me like it falls under the
anti-pattern of "making the last call in a function weird".  A lot of
times people change from failure handling to success handling for the
last function call.

	err = one();
	if (err)
		goto fail;
	err = two();
	if (err)
		goto fail;
	err = three();
	if (!err)
		return 0;
goto fail:
	print("failed!\n");

It seems crazy, but people do this all the time!  It's fine to do:

	return three();

There are some maintainers who insist that it should be:

	err = three();
	if (err)
		return err;
	return 0;

I don't go as far as that.  But I also do like when I can glance at the
function and there is a giant "return 0;" at the bottom.

Anyway, if people change it back to ternary then the kbuild bot will
send them a warning message and they'll learn about an odd quirk in C's
type promotion rules.

regards,
dan carpenter
