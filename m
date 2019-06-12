Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3145441D7A
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2019 09:19:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NytD4nNHzDr08
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2019 17:19:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=xs4all.nl
 (client-ip=194.109.24.22; helo=lb1-smtp-cloud9.xs4all.net;
 envelope-from=hverkuil@xs4all.nl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xs4all.nl
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nysl35hqzDr4L
 for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jun 2019 17:19:02 +1000 (AEST)
Received: from [192.168.2.10] ([46.9.252.75])
 by smtp-cloud9.xs4all.net with ESMTPA
 id axVwhAN8PbiAgaxW0hBaxf; Wed, 12 Jun 2019 09:17:57 +0200
Subject: Re: [PATCH v3 10/10] media: aspeed: add a workaround to fix a silicon
 bug
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
 <20190531221548.14757-11-jae.hyun.yoo@linux.intel.com>
 <38a8ca27-9991-fe8c-4d89-abdaacd4130b@linux.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <490d6111-32c1-f8f4-dc3c-39314446709e@xs4all.nl>
Date: Wed, 12 Jun 2019 09:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <38a8ca27-9991-fe8c-4d89-abdaacd4130b@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNp2LdLUEuyg0J9A8VPdbi+7NSBLqrkD7ZEhl+PZK4PgQMoUJDLDqBlCNVChJSzbB6lRGVkqYAxn24RJ5uD1sQC3sDTK4IpNXQVHAaELn7Um8ELGje94
 ooHd48CMTZ8lG4OFTxfRlDE5SpJvXnnUyBjer9+b2joysAAgfi3MOhYscihO8+CHfhEkcxA1bRFob+9SYZMzVfLp0O+wECY3QHu8CkbBeP4P9qHm8rGUH6ag
 3MCkR1g5CE/+ErSNLJDE5ASvE92lgz/QZtuqtqTz1BfTHWBSM6VpdqtyyjB4zURHY6za7ojgqHSEZV9vFpOxkfrLlm/h7CPW5+hQ9aRLI63vkg6cHr3FIA3u
 cSr90zhgsTkX/tWUm5iPLhXHZ7bsJW/fnR7KufqcbJdj9HQLiJU000j3TU+PC1Ume8qFayPc
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

Eddie: ping!

Regards,

	Hans

On 6/6/19 2:53 AM, Jae Hyun Yoo wrote:
> Hi Eddie,
> 
> All patches in this series were queued to linux/media tree except this
> one. Can you please review this patch?
> 
> Thanks,
> Jae
> 
> On 5/31/2019 3:15 PM, Jae Hyun Yoo wrote:
>> AST2500 silicon revision A1 and A2 have a silicon bug which causes
>> extremly long capturing time on specific resolutions (1680 width).
>> To fix the bug, this commit adjusts the capturing window register
>> setting to 1728 if detected width is 1680. The compression window
>> register setting will be kept as the original width so output
>> result will be the same.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> v2 -> v3:
>>   Added more detail comments why the value 1728 is picked.
>>
>> v1 -> v2:
>>   New.
>>
>>   drivers/media/platform/aspeed-video.c | 28 ++++++++++++++++++++-------
>>   1 file changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index ba093096a5a7..f899ac3b4a61 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -824,8 +824,29 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   	struct v4l2_bt_timings *act = &video->active_timings;
>>   	unsigned int size = act->width * act->height;
>>   
>> +	/* Set capture/compression frame sizes */
>>   	aspeed_video_calc_compressed_size(video, size);
>>   
>> +	if (video->active_timings.width == 1680) {
>> +		/*
>> +		 * This is a workaround to fix a silicon bug on A1 and A2
>> +		 * revisions. Since it doesn't break capturing operation of
>> +		 * other revisions, use it for all revisions without checking
>> +		 * the revision ID. It picked 1728 which is a very next
>> +		 * 64-pixels aligned value to 1680 to minimize memory bandwidth
>> +		 * and to get better access speed from video engine.
>> +		 */
>> +		aspeed_video_write(video, VE_CAP_WINDOW,
>> +				   1728 << 16 | act->height);
>> +		size += (1728 - 1680) * video->active_timings.height;
>> +	} else {
>> +		aspeed_video_write(video, VE_CAP_WINDOW,
>> +				   act->width << 16 | act->height);
>> +	}
>> +	aspeed_video_write(video, VE_COMP_WINDOW,
>> +			   act->width << 16 | act->height);
>> +	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>> +
>>   	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>>   	if (size < DIRECT_FETCH_THRESHOLD) {
>>   		aspeed_video_write(video, VE_TGS_0,
>> @@ -842,13 +863,6 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>   		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>>   	}
>>   
>> -	/* Set capture/compression frame sizes */
>> -	aspeed_video_write(video, VE_CAP_WINDOW,
>> -			   act->width << 16 | act->height);
>> -	aspeed_video_write(video, VE_COMP_WINDOW,
>> -			   act->width << 16 | act->height);
>> -	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>> -
>>   	size *= 4;
>>   
>>   	if (size != video->srcs[0].size) {
>>

