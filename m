Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DF9D00D
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2019 15:06:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HC2S3dL3zDqQW
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2019 23:06:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="VRHBnQud"; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HC2C634GzDqQW
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2019 23:06:42 +1000 (AEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QD4BNI089364;
 Mon, 26 Aug 2019 13:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=vJnEs/zVB+9mS41wRVHEaFY5nc+m3Axz/YoiQ2okbtI=;
 b=VRHBnQudsig8Q5m9ZDhcs/dKeMXUikug+wfXXpZuj8XzIYHUR7QZV7KcdlFbHep6i8Dw
 Cp9h5qptKM8jLJ/V6tMGij4q2WpRO0jhUNNrUPum5Sz+sz55PTuy+znsSDS5gL4GZXKj
 V/+NTrqoaPO+PwF/cSim6/Q1bjJ5CgNx0JDEFnhNcDw3ZrRONmyO/zuJerRUWlaGHWrU
 B071FxmRqImNAxsxR9aj/kN0FzMVYGu/Wbc9pFFjelr6KEWLHzu8rY4KqcgGQ/czQvdm
 llyzjznMReoPW+Bq3sGbu8C5puWsXu+shjSzLxSyfj9mAN7wW9qtBp9pUckgsCD8EzNO IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2ujw718x0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:04:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QD49P3095525;
 Mon, 26 Aug 2019 13:04:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2ujw6htgtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:04:22 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7QD3tS1016179;
 Mon, 26 Aug 2019 13:03:55 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Aug 2019 06:03:54 -0700
Date: Mon, 26 Aug 2019 16:03:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] mmc: aspeed: Fix return value check in
 aspeed_sdc_probe()
Message-ID: <20190826130343.GA23584@kadam>
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826120013.183435-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908260142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908260142
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
                        ^^^^
When we're adding new files, could we use the prefix for the new driver
instead of just the subsystem?  "mmc: aspeed: Add new driver"?
Otherwise it's tricky to know what people want for the driver.

I just wrote this same patch and I swear I would have sent my patch
earlier but I spent hours thinking about the patch prefix and then the
census people came to the house and delayed me even more.

regards,
dan carpenter

