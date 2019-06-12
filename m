Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 401BD42A39
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2019 17:04:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P9C514wjzDqlL
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2019 01:04:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P9BS5H49zDqK6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2019 01:04:14 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5CEsC96059665; Wed, 12 Jun 2019 11:03:58 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t33jk0jx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2019 11:03:57 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5CF0BrB023107;
 Wed, 12 Jun 2019 15:03:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2t1qctse82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2019 15:03:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5CF3rNl32899388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 15:03:54 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EB4CBE051;
 Wed, 12 Jun 2019 15:03:53 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3112CBE04F;
 Wed, 12 Jun 2019 15:03:53 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 15:03:53 +0000 (GMT)
Subject: Re: [PATCH v3 10/10] media: aspeed: add a workaround to fix a silicon
 bug
To: Hans Verkuil <hverkuil@xs4all.nl>, Eddie James <eajames@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
 <20190531221548.14757-11-jae.hyun.yoo@linux.intel.com>
 <38a8ca27-9991-fe8c-4d89-abdaacd4130b@linux.intel.com>
 <490d6111-32c1-f8f4-dc3c-39314446709e@xs4all.nl>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <7486bdf6-8ab1-4e96-d5ca-b1b0f018af6b@linux.vnet.ibm.com>
Date: Wed, 12 Jun 2019 10:03:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <490d6111-32c1-f8f4-dc3c-39314446709e@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120100
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 6/12/19 2:17 AM, Hans Verkuil wrote:
> Eddie: ping!
>
> Regards,
>
> 	Hans
>
> On 6/6/19 2:53 AM, Jae Hyun Yoo wrote:
>> Hi Eddie,
>>
>> All patches in this series were queued to linux/media tree except this
>> one. Can you please review this patch?
>>
>> Thanks,
>> Jae
>>
>> On 5/31/2019 3:15 PM, Jae Hyun Yoo wrote:
>>> AST2500 silicon revision A1 and A2 have a silicon bug which causes
>>> extremly long capturing time on specific resolutions (1680 width).
>>> To fix the bug, this commit adjusts the capturing window register
>>> setting to 1728 if detected width is 1680. The compression window
>>> register setting will be kept as the original width so output
>>> result will be the same.


Sorry, missed your followup email Jae and assumed everything was merged.


Looks fine to me.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>>>
>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>> ---
>>> v2 -> v3:
>>>    Added more detail comments why the value 1728 is picked.
>>>
>>> v1 -> v2:
>>>    New.
>>>
>>>    drivers/media/platform/aspeed-video.c | 28 ++++++++++++++++++++-------
>>>    1 file changed, 21 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>>> index ba093096a5a7..f899ac3b4a61 100644
>>> --- a/drivers/media/platform/aspeed-video.c
>>> +++ b/drivers/media/platform/aspeed-video.c
>>> @@ -824,8 +824,29 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>>    	struct v4l2_bt_timings *act = &video->active_timings;
>>>    	unsigned int size = act->width * act->height;
>>>    
>>> +	/* Set capture/compression frame sizes */
>>>    	aspeed_video_calc_compressed_size(video, size);
>>>    
>>> +	if (video->active_timings.width == 1680) {
>>> +		/*
>>> +		 * This is a workaround to fix a silicon bug on A1 and A2
>>> +		 * revisions. Since it doesn't break capturing operation of
>>> +		 * other revisions, use it for all revisions without checking
>>> +		 * the revision ID. It picked 1728 which is a very next
>>> +		 * 64-pixels aligned value to 1680 to minimize memory bandwidth
>>> +		 * and to get better access speed from video engine.
>>> +		 */
>>> +		aspeed_video_write(video, VE_CAP_WINDOW,
>>> +				   1728 << 16 | act->height);
>>> +		size += (1728 - 1680) * video->active_timings.height;
>>> +	} else {
>>> +		aspeed_video_write(video, VE_CAP_WINDOW,
>>> +				   act->width << 16 | act->height);
>>> +	}
>>> +	aspeed_video_write(video, VE_COMP_WINDOW,
>>> +			   act->width << 16 | act->height);
>>> +	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>>> +
>>>    	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>>>    	if (size < DIRECT_FETCH_THRESHOLD) {
>>>    		aspeed_video_write(video, VE_TGS_0,
>>> @@ -842,13 +863,6 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>>    		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>>>    	}
>>>    
>>> -	/* Set capture/compression frame sizes */
>>> -	aspeed_video_write(video, VE_CAP_WINDOW,
>>> -			   act->width << 16 | act->height);
>>> -	aspeed_video_write(video, VE_COMP_WINDOW,
>>> -			   act->width << 16 | act->height);
>>> -	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>>> -
>>>    	size *= 4;
>>>    
>>>    	if (size != video->srcs[0].size) {
>>>
